import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lojong/src/assets.dart';

class LojongAppBar extends StatelessWidget {
  const LojongAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 8.0,
        right: 8.0,
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "inspirações".toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: null,
          icon: SvgPicture.asset(
            LojongIcons.arrowBack,
            height: 14,
          ),
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black12)),
        ),
      ),
    );
  }
}
