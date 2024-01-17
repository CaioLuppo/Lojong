import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lojong/insight/view/insight.view.dart';
import 'package:lojong/model/video.model.dart';
import 'package:lojong/src/assets.dart';

import '../../components/thumb_place_holder.dart';

class VideoThumbNail extends StatelessWidget {
  const VideoThumbNail({
    super.key,
    required this.video,
  });

  final Video video;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CachedNetworkImage(
        imageUrl: video.imageUrl ?? "",
        fadeOutDuration: const Duration(milliseconds: 300),
        placeholder: (_, __) => const ThumbPlaceHolder(),
        errorWidget: (_, __, ___) => const ThumbPlaceHolder(error: true),
        imageBuilder: (_, imageProvider) => InkWell(
          onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => InsightView(content: video),
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder: (_, a, __, c) =>
                  FadeTransition(opacity: a, child: c),
            ),
          ),
          child: Stack(
            children: [
              Image(
                image: imageProvider,
                height: 192,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    LojongIcons.playButton,
                    height: 56,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
