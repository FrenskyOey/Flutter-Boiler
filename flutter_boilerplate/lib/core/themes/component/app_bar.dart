import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/themes/app_text.dart';
import 'package:flutter_boilerplate/core/themes/app_color.dart';


final appBarLight = AppBarTheme(
  backgroundColor: AppColor.background(),
  shadowColor: Colors.transparent,
  elevation: 0.0,
  centerTitle: true,
  scrolledUnderElevation: 10.0,
  toolbarHeight: 72.0,
  titleTextStyle: AppText.baseTextTheme.titleMedium!.copyWith(
    color: AppColor.textPrimary(),
    fontWeight: FontWeight.normal,
  ),
  // icons button theme
  actionsIconTheme: IconThemeData(color: AppColor.textSecondary(), size: 16.0),
);

final appBarDark = AppBarTheme(
  backgroundColor: AppColor.background(isDarkMode: true),
  shadowColor: Colors.transparent,
  elevation: 0.0,
  centerTitle: true,
  scrolledUnderElevation: 10.0,
  toolbarHeight: 72.0,
  titleTextStyle: AppText.darkTextTheme.titleMedium!.copyWith(
    color: AppColor.textPrimary(isDarkMode: true),
    fontWeight: FontWeight.normal,
  ),
  // icons button theme
  actionsIconTheme: IconThemeData(color: AppColor.textSecondary(isDarkMode: true), size: 16.0),
);
