import 'package:flutter/material.dart';
import 'package:lojong/page_navigator/components/lojong_appbar.dart';
import 'package:lojong/page_navigator/components/page_slider.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({super.key});

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  final List<Widget> _tabsBody = [
    Container(),
    Container(),
    Container(),
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
