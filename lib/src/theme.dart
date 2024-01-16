import 'package:flutter/material.dart';
import 'package:lojong/src/colors.dart';

abstract class LojongThemeData {
  static ThemeData get theme {
    return ThemeData(
      textTheme: const TextTheme(
        displaySmall: TextStyle(
          fontFamily: "Asap",
          fontWeight: FontWeight.bold,
          color: LojongColors.text,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          fontFamily: "Asap",
          fontSize: 16,
          color: LojongColors.text
        ),
        titleMedium: TextStyle(
          fontFamily: "Asap",
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: LojongColors.text,
        )
      ),
    );
  }
}
