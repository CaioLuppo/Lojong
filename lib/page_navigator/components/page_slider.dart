import 'package:flutter/material.dart';
import 'package:lojong/src/colors.dart';

class PageSlider extends StatelessWidget {
  final TabController controller;

  const PageSlider(this.controller, {super.key});

  final String videosLabel = "vídeos";
  final String articlesLabel = "artigos";
  final String citationsLabel = "citações";

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Tab(text: videosLabel.toUpperCase()),
      Tab(text: articlesLabel.toUpperCase()),
      Tab(text: citationsLabel.toUpperCase()),
    ];
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
        right: 8.0,
        bottom: 16.0,
      ),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(360),
          color: Colors.black12,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TabBar(
            tabs: tabs,
            indicatorPadding: const EdgeInsets.all(0),
            indicatorWeight: 0,
            labelStyle: const TextStyle(
              fontFamily: "Asap",
              fontWeight: FontWeight.bold,
            ),
            padding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            controller: controller,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(360),
              color: Colors.white,
            ),
            unselectedLabelColor: Colors.white,
            labelColor: LojongColors.selectedColor,
            dividerHeight: 0,
          ),
        ),
      ),
    );
  }
}
