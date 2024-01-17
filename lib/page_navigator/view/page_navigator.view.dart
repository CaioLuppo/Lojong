import 'package:flutter/material.dart';
import 'package:lojong/articles/view/articles.view.dart';
import 'package:lojong/quotes/view/quotes.view.dart';
import 'package:lojong/page_navigator/components/lojong_appbar.dart';
import 'package:lojong/page_navigator/components/page_slider.dart';
import 'package:lojong/videos/view/videos.view.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({super.key});

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  final List<Widget> _tabsBody = [
    const VideosPage(),
    const ArticlesPage(),
    const QuotesPage(),
  ];

  @override
  void initState() {
    _controller = TabController(
      length: _tabsBody.length,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LojongAppBar(),
        const SizedBox(height: 4),
        PageSlider(_controller),
        Expanded(
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: TabBarView(
              controller: _controller,
              children: _tabsBody,
            ),
          ),
        ),
      ],
    );
  }
}
