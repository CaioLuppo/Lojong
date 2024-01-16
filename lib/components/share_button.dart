import 'package:flutter/material.dart';
import 'package:lojong/src/colors.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ElevatedButton(
      onPressed: null,
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          LojongColors.buttonBackGround,
        ),
        foregroundColor: MaterialStatePropertyAll(
          LojongColors.text,
        ),
      ),
      child: Row(
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
