import 'package:flutter/material.dart';

const listColor = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
];

class AppTheme {
  final int selectedColor;
  final bool isDark;
  AppTheme({required this.selectedColor, required this.isDark})
    : assert(
        selectedColor >= 0 && selectedColor < listColor.length,
        "Selected color index is out of bounds",
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: listColor[selectedColor],
    brightness: isDark ? Brightness.dark : Brightness.light,
    appBarTheme: const AppBarTheme(centerTitle: false),
  );
}
