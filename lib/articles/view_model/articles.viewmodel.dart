import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lojong/dio/api_client.dart';
import 'package:lojong/model/article_element.model.dart';
import 'package:provider/provider.dart';

class ArticlesViewModel with ChangeNotifier {
  final Dio _client = Client().init();

  static bool gotPages = false;
  int pages = 1;
  int currentPage = 1;

  Future<List<ArticleElementModel>> getAllListElements(
      BuildContext context, int page) async {
    final articlesList = <ArticleElementModel>[];
    final response = await _client.get("/articles2?page=$page");
    if (context.mounted && !gotPages) {
      gotPages = true;
      final provider = Provider.of<ArticlesViewModel>(context, listen: false);
      provider.updatePages(response.data["last_page"]);
    }
    for (Map<String, dynamic> article in response.data["list"]) {
      articlesList.add(
        ArticleElementModel.fromMap(article),
      );
    }
    return articlesList;
  }

  void updatePages(int pages) {
    this.pages = pages;
    notifyListeners();
  }

  void previousPage() {
    currentPage--;
    notifyListeners();
  }

  void nextPage() {
    currentPage++;
    notifyListeners();
  }
}
