import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  @override
  final Color secondaryColor = const Color(0xFFFFFF);
  @override
  final Color accentColor = const Color(0xFFFFFF);
}

class AppTheme {
  ThemeData theme(Palette palette) {
    final theme = ThemeData(
      textTheme: GoogleFonts.quicksandTextTheme(),
      primaryColor: palette.primaryColor,
      secondaryHeaderColor: palette.secondaryColor,
      scaffoldBackgroundColor: palette.scaffoldBackgroundColor,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: palette.accentColor),
    );
    return theme.copyWith(
        appBarTheme: AppBarTheme(
            elevation: 0, backgroundColor: palette.appBarBackgroundColor));
  }
}

extension ThemeDatas on BuildContext {
  ThemeData get themeData => Theme.of(this);
}
