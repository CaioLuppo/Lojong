import 'package:flutter/material.dart';
import 'package:lojong/src/colors.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Carregando".toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        const CircularProgressIndicator(color: LojongColors.background),
      ],
    );
  }
}
