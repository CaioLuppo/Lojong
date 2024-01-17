import 'package:flutter/material.dart';
import 'package:lojong/components/loading.dart';
import 'package:lojong/src/colors.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;

  const VideoPlayerWidget(this.url, {super.key});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.url),
    )..initialize().then((_) {
        controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: Container(
        color: LojongColors.text.withOpacity(0.2),
        child: controller.value.isInitialized
            ? Stack(
                children: [
                  VideoPlayer(
                    controller,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IconButton(
                      onPressed: () {
                        if (controller.value.isPlaying) {
                          controller.pause();
                          setState(() {});
                        } else {
                          controller.play();
                          setState(() {});
                        }
                      },
                      icon: controller.value.isPlaying
                          ? const Icon(Icons.pause)
                          : const Icon(Icons.play_arrow),
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          LojongColors.buttonBackGround,
                        ),
                      ),
                    ),
                  )
                ],
              )
            : const Loading(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
