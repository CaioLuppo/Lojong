import 'package:flutter/material.dart';
import 'package:lojong/page_navigator/view/page_navigator.view.dart';
import 'package:lojong/src/colors.dart';
import 'package:lojong/src/theme.dart';

void main() {
  runApp(const LojongApp());
}

class LojongApp extends StatelessWidget {
  const LojongApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: LojongThemeData.theme,
      home: Scaffold(
        body: Container(
          color: LojongColors.background,
          child: const SafeArea(
            child: PageNavigator(),
          ),
        ),
      ),
    );
  }
}
