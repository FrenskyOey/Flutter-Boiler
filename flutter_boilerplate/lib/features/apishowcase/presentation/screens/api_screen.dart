import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/helpers/snackbar_helper.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';
import 'package:flutter_boilerplate/core/widgets/state/empty_state_widget.dart';
import 'package:flutter_boilerplate/core/widgets/state/error_state_widget.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/components/soldier_widget.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/controllers/soldier_controller.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/controllers/soldier_event.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/controllers/state/soldier_event_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DemoApiScreen extends HookConsumerWidget {
  const DemoApiScreen({super.key});

  Widget _buildProgressBar({Color colors = AppColor.secondary}) {
    return Center(
      child: SizedBox(
        height: 30,
        width: 30,
        child: CircularProgressIndicator(strokeWidth: 2, color: colors),
      ).paddingAll(Dimens.md),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final apiState = ref.watch(soldierControllerProvider);

    ref.listen(soldierEventProvider, (prev, next) {
      if (next == null) {
        return;
      }

      next.maybeWhen(
        toastError: (message) {
          SnackBarHelper.showError(context, message);
        },
        toastSuccess: (message) {
          SnackBarHelper.showSuccess(context, message);
        },
        openUser: (data) {
          SnackBarHelper.showWarning(
            context,
            "${data.name} detail will be open later",
          );
        },
        orElse: () {},
      );

      ref.read(soldierEventProvider.notifier).resetState();
    });

    void loadNextPage() async {
      if (!context.mounted) {
        return;
      }

      await ref.read(soldierControllerProvider.notifier).loadNextPage();
    }

    void onScroll() {
      final scrollThreshold = scrollController.position.maxScrollExtent - 200;
      // if data empty we will skil the logic
      if (scrollThreshold <= 0) {
        return;
      }

      // Check if we are at the bottom (with a 200px threshold)
      if (scrollController.position.pixels >= scrollThreshold) {
        loadNextPage();
      }
    }

    useEffect(() {
      scrollController.addListener(onScroll);
      Future.delayed(Duration.zero, loadNextPage);
      return () => scrollController.removeListener(onScroll);
    }, []);

    return Scaffold(
      appBar: AppBar(title: const Text('Api Call Demo')),
      body: Container(
        child: apiState.maybeWhen(
          data: (data) {
            final soldierData = data.data;
            if (soldierData.isEmpty) {
              return const EmptyStateWidget();
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: soldierData.length,
                    itemBuilder: (context, index) {
                      return SoldierWidget(
                        entity: soldierData[index],
                        onPressed: (data) {
                          ref
                              .read(soldierControllerProvider.notifier)
                              .openDetailPage(data);
                        },
                      );
                    },
                  ),
                ),
                if ((data.hideLoading ?? true) == false)
                  Container(
                    width: double.infinity,
                    color: AppColor.primary,
                    child: _buildProgressBar(colors: Colors.white),
                  ),
              ],
            );
          },
          error: (erorr, stack) {
            return ErrorStateWidget(
              subtitle: erorr as String,
              onButtonPressed: () {
                loadNextPage();
              },
            );
          },
          loading: () {
            return _buildProgressBar();
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
