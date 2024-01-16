import 'package:flutter/material.dart';
import 'package:lojong/src/colors.dart';

class ThumbPlaceHolder extends StatelessWidget {
  final bool error;

  const ThumbPlaceHolder({
    super.key,
    this.error = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: LojongColors.text,
      ),
      child: Center(
        child: error
            ? const Icon(Icons.image_not_supported_rounded)
            : const CircularProgressIndicator(
                color: Colors.white60,
              ),
      ),
    );
  }
}
