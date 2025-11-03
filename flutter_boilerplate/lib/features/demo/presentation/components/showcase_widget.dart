import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';
import 'package:flutter_boilerplate/features/demo/presentation/models/showcase_item.dart';

class ShowcaseWidget extends StatelessWidget {
  final ShowcaseItem item;
  final VoidCallback onPressed;

  const ShowcaseWidget({
    super.key,
    required this.item,
    required this.onPressed,
  });

  Widget _iconContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.ms),
      decoration: BoxDecoration(
        color: context.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(Dimens.sm),
      ),
      child: Icon(item.icon, color: context.secondary, size: 24),
    );
  }

  Widget _contentContainer(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.title, style: context.titleMedium),
        Dimens.xs.space,
        Text(item.subtitle, style: context.bodyLarge),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final shapes = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.ms),
    );

    return Card(
      shape: shapes,
      elevation: 1,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onPressed,
        customBorder: shapes,
        child: Row(
          children: [
            _iconContainer(context),
            Dimens.md.space,
            Expanded(child: _contentContainer(context)),
            Icon(Icons.chevron_right, color: context.secondary),
          ],
        ).paddingAll(Dimens.md),
      ),
    ).paddingBoth(Dimens.sm, Dimens.md);
  }
}
