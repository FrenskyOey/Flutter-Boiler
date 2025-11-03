import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/themes/app_text.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';

final appBarLight = AppBarTheme(
  backgroundColor: Colors.white,
  shadowColor: Colors.transparent,
  surfaceTintColor: Colors.transparent,
  elevation: 0.0,
  centerTitle: true,
  scrolledUnderElevation: 10.0,
  toolbarHeight: 56.0,
  toolbarTextStyle: AppText.baseTextTheme.titleMedium!.copyWith(
    fontSize: 18.0,
    color: AppColor.textPrimary(),
    fontWeight: FontWeight.w600,
  ),
  titleTextStyle: AppText.baseTextTheme.titleMedium!.copyWith(
    fontSize: 18.0,
    color: AppColor.textPrimary(),
    fontWeight: FontWeight.w600,
  ),
  // icons button theme
  actionsIconTheme: IconThemeData(color: AppColor.textSecondary(), size: 16.0),
);

final appBarDark = AppBarTheme(
  backgroundColor: AppColor.background(isDarkMode: true),
  shadowColor: Colors.transparent,
  surfaceTintColor: Colors.transparent,
  elevation: 0.0,
  centerTitle: true,
  scrolledUnderElevation: 10.0,
  toolbarHeight: 56.0,
  toolbarTextStyle: AppText.darkTextTheme.titleMedium!.copyWith(
    fontSize: 18.0,
    color: AppColor.textPrimary(isDarkMode: true),
    fontWeight: FontWeight.w600,
  ),
  titleTextStyle: AppText.darkTextTheme.titleMedium!.copyWith(
    fontSize: 18.0,
    color: AppColor.textPrimary(isDarkMode: true),
    fontWeight: FontWeight.w600,
  ),
  // icons button theme
  actionsIconTheme: IconThemeData(
    color: AppColor.textSecondary(isDarkMode: true),
    size: 16.0,
  ),
);
