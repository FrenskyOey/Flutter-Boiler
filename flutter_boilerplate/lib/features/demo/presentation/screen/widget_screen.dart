import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/helpers/snackbar_helper.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';
import 'package:flutter_boilerplate/core/widgets/button/progress_button.dart';
import 'package:flutter_boilerplate/core/widgets/button/social_button.dart';
import 'package:flutter_boilerplate/core/widgets/image/avatar_image.dart';
import 'package:flutter_boilerplate/core/widgets/textInput/spinner_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WidgetScreen extends HookConsumerWidget {
  const WidgetScreen({super.key});

  Widget _sectionWidget(String title, BuildContext context) {
    return Text(title, style: context.titleLarge);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    void onSocialBtnPress() {
      SnackBarHelper.showWarning(context, "Btn Social Pressed");
    }

    void updateSelection(String? item) {
      if (item == null) {
        return;
      }

      SnackBarHelper.showWarning(context, "$item is selected");
    }

    String? validateSpinner(String? value) {
      if (value == null || value.isEmpty) {
        return 'Spinner not valid';
      }
      return null;
    }

    Future<String> testProgress() async {
      await Future.delayed(Duration(seconds: 3));
      if (context.mounted) {
        SnackBarHelper.showSuccess(context, "Progress Finish");
      }
      return "Success";
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Widget Screen')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionWidget("Social Button", context),
            Dimens.lg.space,
            SocialLoginButton(onPressed: onSocialBtnPress),
            Dimens.lg.space,
            ProgressButton(text: "Progress buttons", onPressed: testProgress),
            Dimens.lg.space,
            _sectionWidget("Avatar Icon", context),
            Dimens.lg.space,
            const Wrap(
              spacing: Dimens.md,
              runSpacing: Dimens.md,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                AvatarImage(name: "John Doe", size: AvatarSize.large),
                AvatarImage(
                  src: "https://randomuser.me/api/portraits/men/1.jpg",
                  name: "Jill Doe",
                  size: AvatarSize.large,
                ),
                AvatarImage(name: "Billy", size: AvatarSize.medium),
                AvatarImage(
                  src: "https://randomuser.me/api/portraits/men/2.jpg",
                  name: "Billy Joe",
                  size: AvatarSize.medium,
                ),
                AvatarImage(name: "Anne", size: AvatarSize.small),
                AvatarImage(
                  src: "https://randomuser.me/api/portraits/men/3.jpg",
                  name: "Annes",
                  size: AvatarSize.small,
                ),
              ],
            ),
            Dimens.lg.space,
            _sectionWidget("Form View - Spinner", context),
            Dimens.lg.space,
            Form(
              key: formKey,
              child: Column(
                children: [
                  SpinnerFormField(
                    labelText: "Select data",
                    items: [
                      "Items 1",
                      "Items 2",
                      "Items 3",
                      "Items 4",
                      "Items 5",
                      "Items 6",
                    ],
                    onChanged: (items) {
                      updateSelection(items);
                    },
                    validator: validateSpinner,
                  ),
                ],
              ),
            ),
            Dimens.lg.space,
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  if (formKey.currentState?.validate() != true) return;
                  SnackBarHelper.showSuccess(context, "Form is Valid");
                },
                child: const Text('Validates'),
              ),
            ),
            Dimens.md.space,
            Text(
              "Insert empty selection to trigger error state",
              style: context.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
