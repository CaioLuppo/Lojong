import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:lojong/articles/view_model/articles.viewmodel.dart';
import 'package:lojong/insight/viewmodel/insight.viewmodel.dart';
import 'package:lojong/page_navigator/view/page_navigator.view.dart';
import 'package:lojong/quotes/view_model/quotes.viewmodel.dart';
import 'package:lojong/src/colors.dart';
import 'package:lojong/src/theme.dart';
import 'package:provider/provider.dart';

void main() {
  ChuckerFlutter.showOnRelease = false;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArticlesViewModel()),
        ChangeNotifierProvider(create: (_) => QuotesViewModel()),
        ChangeNotifierProvider(create: (_) => InsightViewModel()),
      ],
      child: const LojongApp(),
    ),
  );
}

class LojongApp extends StatelessWidget {
  const LojongApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
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
