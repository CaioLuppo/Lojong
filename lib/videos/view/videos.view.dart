import 'package:flutter/material.dart';
import 'package:lojong/components/session_error_message.dart';
import 'package:lojong/src/strings.dart';
import 'package:lojong/videos/components/video_element.dart';
import 'package:lojong/videos/view_model/videos.viewmodel.dart';

import '../../components/loading.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({super.key});

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: VideosViewModel().getAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 40),
                padding: const EdgeInsets.all(24),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final video = snapshot.data![index];
                  return VideoElement(video);
                },
              );
            } else {
              return const SessionErrorMessage(message: "Ainda não há vídeos!");
            }
          } else {
            return SessionErrorMessage(
              message: LojongStrings.networkError,
              reloadFunction: () => setState(() {}),
            );
          }
        } else {
          return const Loading();
        }
      },
    );
  }
}
