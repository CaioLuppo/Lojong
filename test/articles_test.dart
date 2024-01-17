import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lojong/articles/view_model/articles.viewmodel.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class DioErrorMock extends Mock implements Dio {
  @override
  Future<Response<T>> get<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return Future.value(Response(
      requestOptions: RequestOptions(),
      data: null,
      statusCode: 404,
    ));
  }
}

class DioSuccessMock extends Mock implements Dio {
  @override
  Future<Response<T>> get<T>(String path,
      {Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) {
    return Future.value(
      Response(
        requestOptions: RequestOptions(),
        data: {
          "has_more": true,
          "current_page": 1,
          "last_page": 5,
          "next_page": 2,
          "list": [
            {
              "id": 5,
              "text":
                  "Falamos muito da possibilidade de mudança. Como isso acontece no contexto da formação contemplativa?",
              "title": "A libertação dos pensamentos",
              "image_url":
                  "https://d2g3qjbxchhsv1.cloudfront.net/images/artigos/iamgeartigo2.jpg",
              "author_name": "Matthieu Ricard",
              "url":
                  "https://lojongapp.com/blog/article/5/a-libertacao-dos-pensamentos",
              "premium": 0,
              "order": 2,
              "image":
                  "https://d2g3qjbxchhsv1.cloudfront.net/images/artigos/iamgeartigo2.jpg",
            },
          ]
        } as T?,
        statusCode: 200,
      ),
    );
  }
}

void main() {
  group("getAll returns", () {
    testWidgets(
      "should return an empty list when error",
      (tester) async {
        final Dio dio = DioErrorMock();
        final repository = ArticlesViewModel(dio);
        tester.pumpWidget(
          ChangeNotifierProvider(
            create: (context) => ArticlesViewModel(dio),
            child: Builder(
              builder: (context) {
                repository.loadArticlesFromPage(context, 1).then(
                  (_) {
                    expect(repository.articles.isEmpty, equals(true));
                  },
                );
                return const SizedBox();
              },
            ),
          ),
        );
      },
    );

    testWidgets(
      "should return a not empty list when success",
      (tester) async {
        final Dio dio = DioSuccessMock();
        final repository = ArticlesViewModel(dio);
        tester.pumpWidget(
          ChangeNotifierProvider(
            create: (context) => ArticlesViewModel(dio),
            child: Builder(
              builder: (context) {
                repository.loadArticlesFromPage(context, 1).then(
                  (_) {
                    expect(repository.articles.isNotEmpty, equals(true));
                    expect(repository.articles[0].text != null, equals(true));
                  },
                );
                return const SizedBox();
              },
            ),
          ),
        );
      },
    );
  });
}
