import 'package:flutter_svg/flutter_svg.dart';

abstract class LojongIcons {
  static const _path = "assets/icons";

  static final arrowBack = SvgPicture.asset(
    "$_path/arrow_back.svg",
    width: 14,
  );
}