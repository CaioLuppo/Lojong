import 'package:flutter/material.dart';
import 'package:lojong/src/colors.dart';

class BigShareButton extends StatelessWidget {
  const BigShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        onPressed: null,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            LojongColors.bigButtonBackGround,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Compartilhar".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
