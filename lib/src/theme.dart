import 'package:flutter/material.dart';

abstract class LojongThemeData {
  static ThemeData get theme {
    return ThemeData(
      textTheme: const TextTheme(
        displaySmall: TextStyle(
          fontFamily: "Asap",
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
