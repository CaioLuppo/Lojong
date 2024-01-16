import 'package:dio/dio.dart';
import 'package:lojong/dio/api_client.dart';
import 'package:lojong/model/article_element.model.dart';

class ArticlesViewModel {
  final Dio _client = Client().init();

  Future<List<ArticleElementModel>> getAllListElements() async {
    final articlesList = <ArticleElementModel>[];
    final response = await _client.get("/articles2");

    if (response.data != null) {
      final data = response.data!;
      for (int page = 1; page <= data["last_page"]; page++) {
        if (page == 1) {
          for (Map<String, dynamic> article in data["list"]) {
            articlesList.add(
              ArticleElementModel.fromMap(article),
            );
          }
          continue;
        } else {
          final loopResponse = await _client.get("/articles2?page=$page");
          if (loopResponse.data != null) {
            for (Map<String, dynamic> article in loopResponse.data["list"]) {
              articlesList.add(
                ArticleElementModel.fromMap(article),
              );
            }
          }
        }
      }
    }

    return articlesList;
  }
}
