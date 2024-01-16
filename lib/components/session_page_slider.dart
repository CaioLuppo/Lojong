import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lojong/src/assets.dart';
import 'package:lojong/src/colors.dart';

class SessionPageSlider extends StatelessWidget {
  final bool canDecrease;
  final bool canIncrease;

  final int currentPage;

  final void Function() onIncrease;
  final void Function() onDecrease;

  const SessionPageSlider({
    super.key,
    required this.canDecrease,
    required this.canIncrease,
    required this.onIncrease,
    required this.onDecrease,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: canDecrease ? onDecrease : null,
            icon: SvgPicture.asset(
              LojongIcons.arrowBack,
              colorFilter: ColorFilter.mode(
                canDecrease ? LojongColors.background : LojongColors.text,
                BlendMode.srcIn,
              ),
            ),
          ),
          Text(
            currentPage.toString(),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: LojongColors.background,
                  fontWeight: FontWeight.bold,
                ),
          ),
          IconButton(
            onPressed: canIncrease ? onIncrease : null,
            icon: Transform.flip(
              flipX: true,
              flipY: true,
              child: SvgPicture.asset(
                LojongIcons.arrowBack,
                colorFilter: ColorFilter.mode(
                  canIncrease ? LojongColors.background : LojongColors.text,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
