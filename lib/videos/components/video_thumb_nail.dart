import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lojong/model/video.model.dart';
import 'package:lojong/src/assets.dart';
import 'package:lojong/src/colors.dart';

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
        imageUrl: video.imageUrl,
        fadeOutDuration: const Duration(milliseconds: 300),
        placeholder: (context, url) => Container(
          height: 192,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: LojongColors.text,
          ),
          child: const Center(
            child: CircularProgressIndicator(
              color: Colors.white60,
            ),
          ),
        ),
        imageBuilder: (context, imageProvider) => InkWell(
          onTap: null,
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
                  child: LojongIcons.playButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
