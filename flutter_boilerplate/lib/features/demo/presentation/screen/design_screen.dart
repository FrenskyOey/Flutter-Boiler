import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesignScreen extends HookConsumerWidget {
  const DesignScreen({super.key});

  Widget _sectionWidget(String title, BuildContext context) {
    return Text(title, style: context.titleLarge);
  }

  Widget _textThemeWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Display', style: context.displayMedium),
        Dimens.sm.space,
        Text('Headline', style: context.headlineMedium),
        Dimens.sm.space,
        Text('Title', style: context.titleMedium),
        Dimens.sm.space,
        Text('Body', style: context.bodyMedium),
        Dimens.sm.space,
        Text('Label', style: context.labelMedium),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Widget _colorWidget(BuildContext context) {
    return Wrap(
      spacing: Dimens.sm, // Horizontal space between items
      runSpacing: 16.0,
      children: [
        _colorSwatch(context, context.primary, "primary"),
        Dimens.md.space,
        _colorSwatch(context, context.secondary, "secondary"),
        Dimens.md.space,
        _colorSwatch(context, context.tertiary, "tertiary"),
        Dimens.md.space,
        _colorSwatch(context, context.textPrimary, "textPrimary"),
        Dimens.md.space,
        _colorSwatch(context, context.textSecondary, "textSecond"),
        Dimens.md.space,
        _colorSwatch(context, context.error, "error"),
        Dimens.md.space,
        _colorSwatch(context, context.colorScheme.onPrimary, "onPrimary"),
        Dimens.md.space,
        _colorSwatch(context, context.colorScheme.onSecondary, "onSecond"),
      ],
    );
  }

  Widget _colorSwatch(BuildContext context, Color color, String type) {
    return SizedBox(
      width: 78,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500,
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          Dimens.sm.space,
          Align(
            alignment: AlignmentGeometry.center,
            child: Text(
              type,
              textAlign: TextAlign.center,
              style: context.labelSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonComponent(BuildContext context) {
    final List<Widget> buttons = [
      FilledButton(onPressed: () {}, child: const Text('Fill Button')),
      FilledButton(onPressed: null, child: const Text('Fill Button')),
      ElevatedButton(onPressed: () {}, child: const Text('Elevated Button')),
      ElevatedButton(onPressed: null, child: const Text('Elevated Button')),
      OutlinedButton(onPressed: () {}, child: const Text('Outline Button')),
      OutlinedButton(onPressed: null, child: const Text('Outline Button')),
      TextButton(onPressed: () {}, child: const Text('Text Button')),
      TextButton(onPressed: null, child: const Text('Text Button')),
    ];

    return GridView.count(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Optional: if you don't want the grid to scroll
      crossAxisCount: 2, // Two columns
      crossAxisSpacing: 16.0, // Space between columns
      mainAxisSpacing: 16.0, // Space between rows
      childAspectRatio: 3.5,
      padding: const EdgeInsets.all(16.0), // Padding around the grid
      children: buttons,
    );
  }

  Widget _cardComponent(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Burger Sayur", style: context.titleMedium),
              const SizedBox(height: 4),
              Text(
                "Lorem Ipsum sir donor Amet Specialz blablabla",
                style: context.labelMedium,
              ),
            ],
          ),
        ),
        Dimens.md.space,
        // Image Placeholder (using a custom box to simulate the image frame)
        Container(
          width: 100,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.grey[500], // Light grey background for the image area
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            image: const DecorationImage(
              // Using a placeholder image to simulate the burger image
              image: NetworkImage(
                'https://images.pexels.com/photos/1639562/pexels-photo-1639562.jpeg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textFieldController = useTextEditingController();
    final textFieldController2 = useTextEditingController();
    textFieldController2.text = "testing";
    final formKey = useMemoized(() => GlobalKey<FormState>());

    String? _validateString(String? value) {
      if (value == null || value.isEmpty) {
        return 'String is required';
      }
      if (!value.contains('@') || !value.contains('.')) {
        return 'Please enter a valid email';
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Style Guide')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Dimens.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionWidget("Typhography", context),
            Dimens.md.space,
            _textThemeWidget(context),
            Dimens.xl.space,
            _sectionWidget("Color Palete", context),
            Dimens.md.space,
            _colorWidget(context),
            Dimens.md.space,
            _sectionWidget("Components", context),
            _buttonComponent(context),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      labelText: 'Labels',
                      hintText: 'Enter Text',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    validator: _validateString,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  Dimens.lg.space,
                  TextFormField(
                    controller: textFieldController2,
                    enabled: false,
                    decoration: InputDecoration(
                      labelText: 'Disable State',
                      hintText: 'Enter Text',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    validator: _validateString,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                ],
              ),
            ),
            Dimens.md.space,
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimens.ms),
              ),
              elevation: 1,
              margin: EdgeInsets.zero,
              child: InkWell(
                onTap: () {
                  // do nothing
                },
                borderRadius: BorderRadius.circular(Dimens.ms),
                child: _cardComponent(context).paddingAll(Dimens.md),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
