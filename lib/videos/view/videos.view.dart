import 'package:flutter/material.dart';
import 'package:lojong/videos/components/video_element.dart';
import 'package:lojong/videos/view_model/videos.viewmodel.dart';

import '../../components/loading.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

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
              return const Center(
                child: Text("Ainda não há vídeos!"),
              );
            }
          } else {
            return const Center(
              child: Text("Não foi possível carregar nenhum vídeo..."),
            );
          }
        } else {
          return const Loading();
        }
      },
    );
  }
}
