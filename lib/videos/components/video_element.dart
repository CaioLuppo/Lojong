import 'package:flutter/material.dart';
import 'package:lojong/model/video.model.dart';
import 'package:lojong/src/assets.dart';
import 'package:lojong/src/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

class VideoElement extends StatelessWidget {
  final Video video;

  const VideoElement(this.video, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "EP. ${_getString()}: ${video.name.toUpperCase()}",
          style:
              Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: video.imageUrl,
            imageBuilder: (context, imageProvider) => InkWell(
              onTap: null,
              child: Stack(
                children: [
                  Image(
                    image: imageProvider,
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
        ),
        const SizedBox(height: 8),
        Text(
          video.description,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        const ElevatedButton(
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
        )
      ],
    );
  }

  String _getString() {
    String id = video.orderId.toString();
    if (video.orderId < 10) {
      id = "0${video.orderId}";
    }
    return id;
  }
}
