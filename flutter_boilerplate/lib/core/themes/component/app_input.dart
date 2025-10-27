import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';
import 'package:flutter_boilerplate/core/themes/app_text.dart';

class AppInput {
  static final _baseTextStyle = AppText.baseTextTheme;

  static final double _borderRadius = 10.0;
  static final double _borderThin = 1.0;
  static final double _borderThick = 2.0;

  static final _inputBorderStyles = OutlineInputBorder(
    borderRadius: BorderRadius.circular(_borderRadius),
    borderSide: BorderSide(color: AppColor.disabledColor(), width: _borderThin),
  );

  static final inputLightTheme = InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    fillColor: AppColor.inputFill(),
    focusColor: AppColor.surface(),
    filled: true,
    hintStyle: _baseTextStyle.bodyMedium!.copyWith(color: Colors.grey.shade300),
    labelStyle: _baseTextStyle.bodyMedium!.copyWith(color: AppColor.secondary),
    border: _inputBorderStyles,
    enabledBorder: _inputBorderStyles,
    focusedBorder: _inputBorderStyles.copyWith(
      borderSide: BorderSide(color: AppColor.primary, width: _borderThick),
    ),
    errorBorder: _inputBorderStyles.copyWith(
      borderSide: BorderSide(color: AppColor.error, width: _borderThick),
    ),
    focusedErrorBorder: _inputBorderStyles.copyWith(
      borderSide: BorderSide(color: AppColor.error, width: _borderThick),
    ),
    disabledBorder: _inputBorderStyles.copyWith(borderSide: BorderSide.none),
  );

  static final _baseTextStyle2 = AppText.darkTextTheme;

  static final _inputBorderStyles2 = OutlineInputBorder(
    borderRadius: BorderRadius.circular(_borderRadius),
    borderSide: BorderSide(
      color: AppColor.disabledColor(isDarkMode: true),
      width: _borderThin,
    ),
  );

  static final inputDarkTheme = InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    fillColor: AppColor.inputFill(isDarkMode: true),
    focusColor: AppColor.surface(isDarkMode: true),
    filled: true,
    hintStyle: _baseTextStyle2.bodyMedium!.copyWith(color: Colors.white),
    labelStyle: _baseTextStyle2.bodyMedium!.copyWith(color: AppColor.secondary),
    border: _inputBorderStyles2,
    enabledBorder: _inputBorderStyles2,
    focusedBorder: _inputBorderStyles2.copyWith(
      borderSide: BorderSide(color: AppColor.primary, width: _borderThick),
    ),
    errorBorder: _inputBorderStyles2.copyWith(
      borderSide: BorderSide(color: AppColor.error, width: _borderThick),
    ),
    focusedErrorBorder: _inputBorderStyles2.copyWith(
      borderSide: BorderSide(color: AppColor.error, width: _borderThick),
    ),
    disabledBorder: _inputBorderStyles2.copyWith(borderSide: BorderSide.none),
  );
}
