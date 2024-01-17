import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lojong/components/thumb_place_holder.dart';
import 'package:lojong/insight/components/video_player.dart';
import 'package:lojong/model/video.model.dart';

class InsightMedia extends StatelessWidget {
  const InsightMedia({
    super.key,
    required this.data,
  });

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: data is Video
          ? VideoPlayerWidget(data.videoUrl ?? "")
          : CachedNetworkImage(
              imageUrl: data.imageUrl ?? "",
              height: 192,
              width: double.infinity,
              fit: BoxFit.cover,
              fadeOutDuration: const Duration(milliseconds: 300),
              placeholder: (_, __) => const ThumbPlaceHolder(),
              errorWidget: (_, __, ___) => const ThumbPlaceHolder(error: true),
            ),
    );
  }
}
