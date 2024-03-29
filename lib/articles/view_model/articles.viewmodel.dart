import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lojong/model/article_element.model.dart';
import 'package:provider/provider.dart';

class ArticlesViewModel with ChangeNotifier {
  final Dio _client;

  ArticlesViewModel(this._client);

  static bool didRequest = false;
  bool error = false;
  int pages = 1;

  List<ArticleElementModel> articles = [];

  Future<void> loadArticlesFromPage(BuildContext context, int page) async {
    try {
      final response = await _client.get("/articles2?page=$page");
      if (response.data != null) {
        if (context.mounted && !didRequest) {
          didRequest = true;
          final provider =
              Provider.of<ArticlesViewModel>(context, listen: false);
          provider.updatePages(response.data["last_page"]);
        }
        for (Map<String, dynamic> article in response.data["list"]) {
          articles.add(
            ArticleElementModel.fromMap(article),
          );
        }
      } else {
        error = true;
      }
    } catch (_) {
      error = true;
    }
    notifyListeners();
  }

  void updatePages(int pages) {
    this.pages = pages;
    notifyListeners();
  }

  void setError(bool value) {
    error = value;
    notifyListeners();
  }
}
