import 'package:flutter/material.dart';
import 'package:lojong/src/colors.dart';

class ShareButton extends StatelessWidget {
  final Color bgColor;
  final Color textColor;

  const ShareButton({
    super.key,
    this.bgColor = LojongColors.buttonBackGround,
    this.textColor = LojongColors.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          bgColor,
        ),
        foregroundColor: MaterialStatePropertyAll(
          textColor,
        ),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.share),
          SizedBox(width: 8),
          Text("Compartilhar"),
        ],
      ),
    );
  }
}
