import 'package:flutter/material.dart';
import 'package:lojong/src/colors.dart';

abstract class LojongThemeData {
  static ThemeData get theme {
    return ThemeData(
      textTheme: TextTheme(
        displaySmall: const TextStyle(
          fontFamily: "Asap",
          fontWeight: FontWeight.bold,
          color: LojongColors.text,
          fontSize: 16,
        ),
        bodyMedium: const TextStyle(
          fontFamily: "Asap",
          fontSize: 16,
          color: LojongColors.text,
        ),
        bodySmall: TextStyle(
          fontFamily: "Asap",
          fontSize: 11,
          color: LojongColors.authorColor,
        ),
        titleMedium: const TextStyle(
          fontFamily: "Asap",
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: LojongColors.text,
        ),
        titleLarge: const TextStyle(
          fontFamily: "Asap",
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: LojongColors.text,
        ),
        titleSmall: TextStyle(
          fontFamily: "Asap",
          fontWeight: FontWeight.bold,
          fontSize: 12,
          color: LojongColors.authorColor,
        ),
      ),
    );
  }
}
