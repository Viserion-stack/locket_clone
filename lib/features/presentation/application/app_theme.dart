import 'package:flutter/material.dart';

abstract class Palette {
  late Color primaryColor;
  late Color secondaryColor;
  late Color accentColor;
  late Color scaffoldBackgroundColor;
  late Color appBarBackgroundColor;
}

class LightPalette extends Palette {
  @override
  final Color primaryColor = const Color(0xff6D747D);
  @override
  final Color scaffoldBackgroundColor = const Color(0xFFF3F1EB);
  @override
  final Color appBarBackgroundColor = const Color(0xFFF3F1EB);
}

class AppTheme {
  ThemeData theme(Palette palette) {
    final theme = ThemeData(
      primaryColor: palette.primaryColor,
      secondaryHeaderColor: palette.secondaryColor,
      accentColor: palette.accentColor,
      scaffoldBackgroundColor: palette.scaffoldBackgroundColor,
    );
    return theme.copyWith(
        appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: palette.appBarBackgroundColor
    ));
  }
}

extension ThemeDatas on BuildContext {
  ThemeData get themeData => Theme.of(this);
}