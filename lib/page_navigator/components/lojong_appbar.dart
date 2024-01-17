import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lojong/src/assets.dart';

class LojongAppBar extends StatelessWidget {
  final bool hideTitle;
  final void Function()? onReturn;

  const LojongAppBar({super.key, this.hideTitle = false, this.onReturn});

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
        title: hideTitle
            ? null
            : Text(
                "inspirações".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: Colors.white),
              ),
        leading: IconButton(
          onPressed: onReturn,
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
