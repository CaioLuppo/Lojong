import 'package:flutter/material.dart';
import 'package:lojong/dio/api_client.dart';
import 'package:lojong/dio/repository/video_repository.dart';
import 'package:lojong/src/colors.dart';
import 'package:lojong/videos/components/video_element.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: VideoRepository(Client().init()).getAll(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if (snapshot.data!.isNotEmpty) {
              return ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 40);
                },
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
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
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Carregando vídeos".toUpperCase(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 16),
              const CircularProgressIndicator(color: LojongColors.background),
            ],
          );
        }
      },
    );
  }
}
