import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SpinnerFormField extends HookWidget {
  final String labelText;
  final List<String> items;
  final ValueChanged<String?>? onChanged;
  final FormFieldValidator<String>? validator;

  const SpinnerFormField({
    super.key,
    required this.labelText,
    required this.items,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final selectedValue = useState<String?>(null);
    final controller = useTextEditingController();

    void openBottomSheet() async {
      final String? selectedItem = await showModalBottomSheet<String>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return _CustomSpinnerBottomSheet(
            title: labelText,
            items: items,
            currentSelection: selectedValue.value,
          );
        },
      );

      // 5. Update state (selectedValue) and controller
      if (selectedItem != null) {
        selectedValue.value = selectedItem;
        controller.text = selectedItem;
        onChanged?.call(selectedItem);
      }
    }

    return TextFormField(
      readOnly: true,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        suffixIcon: const Icon(Icons.arrow_drop_down),
        border: const OutlineInputBorder(),
      ),
      // 6. Validator checks the hook state
      validator: (value) {
        if (selectedValue.value == null) {
          return validator?.call(null) ?? 'Selection is required';
        }
        return null;
      },
      onTap: openBottomSheet,
    );
  }
}

class _CustomSpinnerBottomSheet extends StatelessWidget {
  final String title;
  final List<String> items;
  final String? currentSelection;

  const _CustomSpinnerBottomSheet({
    required this.title,
    required this.items,
    this.currentSelection,
  });

  @override
  Widget build(BuildContext context) {
    final selectedColor = context.secondary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header with Title and Close Button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Center Title
              Center(child: Text(title, style: context.titleLarge)),
              // Close Button (x button)
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  color: AppColor.secondary,
                  onPressed: () => Navigator.of(context).pop(), // Close sheet
                ),
              ),
            ],
          ),
        ),
        // List of Selectable Items
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              final isSelected = item == currentSelection;

              return ListTile(
                title: Text(
                  item,
                  style: TextStyle(
                    color: isSelected ? selectedColor : null,
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop(item);
                },
              );
            },
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
