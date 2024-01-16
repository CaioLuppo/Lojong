import 'package:dio/dio.dart';
import 'package:lojong/dio/api_client.dart';
import 'package:lojong/model/video.model.dart';

class VideoViewModel {
  final Dio _client = Client().init();

  Future<List<Video>> getAll() async {
    final videoList = <Video>[];
    final response = await _client.get("/videos");
    if (response.data != null) {
      for (Map<String, dynamic> video in response.data) {
        videoList.add(Video.fromMap(video));
      }
    }
    return videoList;
  }
}
