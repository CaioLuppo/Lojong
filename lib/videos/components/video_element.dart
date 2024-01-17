import 'package:flutter/material.dart';
import 'package:lojong/model/video.model.dart';

import '../../components/share_button.dart';
import 'video_thumb_nail.dart';

class VideoElement extends StatelessWidget {
  final Video video;

  const VideoElement(this.video, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "EP. ${_getString()}: ${video.name?.toUpperCase()}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        VideoThumbNail(video: video),
        const SizedBox(height: 8),
        Text(
          video.description ?? "",
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        const ShareButton()
      ],
    );
  }

  String _getString() {
    int id = video.orderId ?? 0;
    String stringId = id.toString();
    if (id < 10) {
      stringId = "0$id";
    }
    return stringId;
  }
}
