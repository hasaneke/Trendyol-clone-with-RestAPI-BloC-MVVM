import 'package:flutter/material.dart';
import 'package:zima_market/product/constants/project_colors.dart';

class ProjectThemes {
  static final lightThemeContext = ThemeData.light();

  static final lightTheme = lightThemeContext.copyWith(
      textTheme: ThemeData.light().textTheme.copyWith(
          displaySmall: lightThemeContext.textTheme.displaySmall!
              .copyWith(color: ProjectColors.displayColor)));
}
