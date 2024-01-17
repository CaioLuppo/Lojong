import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lojong/model/quote.model.dart';
import 'package:provider/provider.dart';

class QuotesViewModel with ChangeNotifier {
  final Dio _client;

  QuotesViewModel(this._client);

  static bool didRequest = false;
  bool error = false;
  int pages = 1;

  List<Quote> quotes = [];

  Future<void> loadQuotesFromPage(BuildContext context, int page) async {
    final response = await _client.get("/quotes2?page=$page");
    if (response.data != null) {
      if (context.mounted && !didRequest) {
        didRequest = true;
        final provider = Provider.of<QuotesViewModel>(context, listen: false);
        provider.updatePages(response.data["last_page"]);
      }
      for (Map<String, dynamic> article in response.data["list"]) {
        quotes.add(
          Quote.fromMap(article),
        );
      }
    }
    notifyListeners();
  }

  void updatePages(int pages) {
    this.pages = pages;
    notifyListeners();
  }
}
