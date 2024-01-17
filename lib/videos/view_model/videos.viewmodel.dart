import 'package:dio/dio.dart';
import 'package:lojong/model/video.model.dart';

class VideosViewModel {
  final Dio _client;

  VideosViewModel(this._client);

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
