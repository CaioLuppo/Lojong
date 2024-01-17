import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lojong/dio/api_client.dart';
import 'package:lojong/model/article.model.dart';

class InsightViewModel with ChangeNotifier {
  final Dio _client = Client().init();

  Future<Article> getArticle(int articleId) async {
    final response = await _client.get("/article-content?articleid=$articleId");
    return Article.fromMap(response.data);
  }
}
