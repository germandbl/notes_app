import 'package:flutter/material.dart';

final colors = <Color>[
  Colors.blue,
  Colors.blueAccent,
  Colors.red, 
  Colors.redAccent,
  Colors.green,
  Colors.greenAccent,
  Colors.pink,
  Colors.pinkAccent,
  Colors.orange,
  Colors.orangeAccent,
  Colors.grey,
  Colors.black,
];

class AppTheme {
  int selectedColor = 0;

  AppTheme({required this.selectedColor});

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colors[selectedColor]
  );
}