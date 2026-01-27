import 'package:flutter/material.dart';

const listColor = [
  Colors.red,
  Colors.blue,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.blueAccent,
];

class AppTheme {
  final int selectedColor;

  AppTheme({required this.selectedColor})
    : assert(
        selectedColor >= 0 && selectedColor < listColor.length,
        "Selected color index is out of bounds",
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: listColor[selectedColor],
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: false,
    ),
  );
}
