import 'package:flutter_boilerplate/core/extension/index.dart';
import 'package:flutter_boilerplate/core/themes/dimens_constant.dart';
import 'package:flutter_boilerplate/core/widgets/image/avatar_image.dart';
import 'package:flutter_boilerplate/features/apishowcase/domain/models/soldier.dart';
import 'package:flutter/material.dart';

class SoldierWidget extends StatelessWidget {
  final Soldier entity;
  final ValueChanged<Soldier> onPressed;

  const SoldierWidget({
    super.key,
    required this.entity,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final shapes = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimens.ms),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Card(
        shape: shapes,
        child: InkWell(
          customBorder: shapes,
          onTap: () {
            onPressed(entity);
          },
          child: ListTile(
            leading: AvatarImage(
              src: entity.avatar,
              name: entity.name,
              size: AvatarSize.medium,
            ),
            title: Text(entity.name, style: context.titleMedium),
          ).paddingVertical(Dimens.xs),
        ),
      ),
    );
  }
}
