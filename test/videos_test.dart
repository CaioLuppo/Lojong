import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
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
        data: [
          {
            "id": 12,
            "name": "Introdução ao Lojong",
            "description":
                "Saiba como o Lojong pode te ajudar a iniciar o treino da mente.",
            "file": null,
            "url": "https://vimeo.com/223279488",
            "url2": "https://youtu.be/7p9pihdUmbw",
            "aws_url":
                "https://1366057841.rsc.cdn77.org/pt/videos/6introlojong.mp4",
            "image":
                "https://applojong.com/files/yatxhjt9zaxka1gdntqw/introthumb.jpg",
            "image_url":
                "https://1776471859.rsc.cdn77.org/images/videos/introducao.jpg",
            "premium": 0,
            "order": 1
          },
        ] as T?,
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
        "should return an empty list when error",
        () async {
          final Dio dio = DioErrorMock();
          final repository = VideosViewModel(dio);
          final list = await repository.getAll();
          expect(list.isEmpty, equals(true));
        },
      );

      test(
        "should return not empty list when success",
        () async {
          final Dio dio = DioSuccessMock();
          final repository = VideosViewModel(dio);
          final list = await repository.getAll();
          expect(list.isNotEmpty, equals(true));
          expect(list[0].name != null, equals(true));
        },
      );
    },
  );
}
