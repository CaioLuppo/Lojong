import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lojong/model/article.model.dart';

class InsightViewModel with ChangeNotifier {
  final Dio _client;

  InsightViewModel(this._client);

  Future<Article?> getArticle(int articleId) async {
    final response = await _client.get("/article-content?articleid=$articleId");
    if (response.data != null) {
      return Article.fromMap(response.data);
    } else {
      return null;
    }
  }
}
