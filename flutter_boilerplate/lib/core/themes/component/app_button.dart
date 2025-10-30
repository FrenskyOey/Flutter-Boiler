import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';
import 'package:flutter_boilerplate/core/themes/app_text.dart';

final baseLightTextStyle = AppText.baseTextTheme;
// Style for all Material 3 buttons (Filled, Elevated, Outlined, Text)
final buttonStyles = ButtonStyle(
  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  ),
  padding: WidgetStateProperty.all<EdgeInsets>(
    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  ),
  textStyle: WidgetStateProperty.all<TextStyle>(
    baseLightTextStyle.titleMedium!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  ),
);

final elevatedButton = ElevatedButtonThemeData(
  style:
      ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.surface(),
        disabledBackgroundColor: AppColor.disabledColor(),
        disabledForegroundColor: Colors.white,
      ).copyWith(
        shape: buttonStyles.shape,
        padding: buttonStyles.padding,
        textStyle: buttonStyles.textStyle,
      ),
);

final fillButton = FilledButtonThemeData(
  style:
      FilledButton.styleFrom(
        backgroundColor: AppColor.secondary,
        foregroundColor: AppColor.surface(),
        disabledBackgroundColor: AppColor.disabledColor(),
        disabledForegroundColor: Colors.white,
      ).copyWith(
        shape: buttonStyles.shape,
        padding: buttonStyles.padding,
        textStyle: buttonStyles.textStyle,
      ),
);

final outlineButton = OutlinedButtonThemeData(
  style:
      OutlinedButton.styleFrom(
        foregroundColor: AppColor.primary,
        disabledForegroundColor: AppColor.disabledColor(),
      ).copyWith(
        shape: buttonStyles.shape,
        padding: buttonStyles.padding,
        textStyle: buttonStyles.textStyle,
        side: WidgetStateProperty.resolveWith((states) {
          final color = states.contains(WidgetState.disabled)
              ? AppColor.disabledColor()
              : AppColor.primary;
          return BorderSide(color: color, width: 1.5);
        }),
      ),
);

final textButton = TextButtonThemeData(
  style: TextButton.styleFrom(
    foregroundColor: AppColor.primary,
    disabledForegroundColor: AppColor.disabledColor(),
  ).copyWith(padding: buttonStyles.padding, textStyle: buttonStyles.textStyle),
);
