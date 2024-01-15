import 'package:flutter/material.dart';
import 'package:lojong/src/assets.dart';

class LojongAppBar extends StatelessWidget {
  const LojongAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        "inspirações".toUpperCase(),
        style: const TextStyle(
          fontFamily: "Asap",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      leading: IconButton(
        onPressed: null,
        icon: LojongIcons.arrowBack,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.black12)
        ),
      ),
    );
  }
}
