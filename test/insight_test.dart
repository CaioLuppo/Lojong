import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lojong/insight/viewmodel/insight.viewmodel.dart';
import 'package:lojong/videos/view_model/videos.viewmodel.dart';
import 'package:mocktail/mocktail.dart';

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
          "id": 1,
          "text": "Dicas de meditação para procrastinadores e perfeccionistas.",
          "title": "Acalmando a mente do “agora não”",
          "image_url": "teste",
          "author_name": "Kate Johnson",
          "url": "teste",
          "premium": 0,
          "order": 4,
          "full_text": "teste",
          "author_image": null,
          "author_description": "teste",
          "image": "teste",
        } as T?,
        statusCode: 200,
      ),
    );
  }
}

void main() {
  group(
    "getAll returns",
    () {
      test(
        "should return null when error",
        () async {
          final Dio dio = DioErrorMock();
          final repository = InsightViewModel(dio);
          final article = await repository.getArticle(1);
          expect(article == null, equals(true));
        },
      );

      test(
        "should return not article when success",
        () async {
          final Dio dio = DioSuccessMock();
          final repository = InsightViewModel(dio);
          final article = await repository.getArticle(1);
          expect(article != null, equals(true));
          expect(article?.authorName != null, equals(true));
        },
      );
    },
  );
}
