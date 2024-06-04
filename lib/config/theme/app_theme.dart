import 'package:flutter/material.dart';

final colors = [
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
  ThemeData getTheme(int index) => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colors[index]
  );
}