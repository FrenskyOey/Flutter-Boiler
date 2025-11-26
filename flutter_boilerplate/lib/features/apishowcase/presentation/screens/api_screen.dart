import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/helpers/snackbar_helper.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';
import 'package:flutter_boilerplate/core/widgets/state/empty_state_widget.dart';
import 'package:flutter_boilerplate/core/widgets/state/screen_content.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/components/soldier_widget.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/controllers/soldier_controller.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/controllers/state/soldier_event_state.dart';
import 'package:flutter_boilerplate/features/apishowcase/presentation/controllers/state/soldier_ui_state.dart';
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
      final sub = ref
          .read(soldierControllerProvider.notifier)
          .getEventStream()
          .listen((event) {
            event.maybeWhen(
              toastError: (message) {
                SnackBarHelper.showError(context, message);
              },
              toastSuccess: (message) {
                SnackBarHelper.showSuccess(context, message);
              },
              openUser: (data) {
                SnackBarHelper.showWarning(
                  context,
                  "Coming Soon ...[${data.name}]",
                );
              },
              orElse: () {},
            );
          });

      return sub.cancel; // Dispose subscription
    }, const []);

    useEffect(() {
      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, const []);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        loadNextPage();
      });
      return;
    }, const []);

    Widget successWidget(SoldierUIState data) {
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
          if (data.hideLoading == false)
            Container(
              width: double.infinity,
              color: AppColor.primary,
              child: _buildProgressBar(colors: Colors.white),
            ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Api Call Demo')),
      body: ScreenContent(
        state: apiState,
        successWidget: (data) {
          return successWidget(data);
        },
        onRetry: () {
          ref.read(soldierControllerProvider.notifier).loadNextPage();
        },
      ),
    );
  }
}
