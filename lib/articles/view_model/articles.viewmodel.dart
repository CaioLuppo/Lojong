import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lojong/dio/api_client.dart';
import 'package:lojong/model/article_element.model.dart';
import 'package:provider/provider.dart';

class ArticlesViewModel with ChangeNotifier {
  final Dio _client = Client().init();

  static bool didRequest = false;
  bool error = false;
  int pages = 1;

  List<ArticleElementModel> articles = [];

  Future<void> loadArticlesFromPage(BuildContext context, int page) async {
    final response = await _client.get("/articles2?page=$page");
    if (context.mounted && !didRequest) {
      didRequest = true;
      final provider = Provider.of<ArticlesViewModel>(context, listen: false);
      provider.updatePages(response.data["last_page"]);
    }
    for (Map<String, dynamic> article in response.data["list"]) {
      articles.add(
        ArticleElementModel.fromMap(article),
      );
    }
    notifyListeners();
  }

  void updatePages(int pages) {
    this.pages = pages;
    notifyListeners();
  }
}
