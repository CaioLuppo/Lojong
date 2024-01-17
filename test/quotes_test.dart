import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lojong/quotes/view_model/quotes.viewmodel.dart';
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
          "last_page": 32,
          "next_page": 2,
          "list": [
            {
              "id": 60,
              "text":
                  "\"Por que você precisa meditar? Porque se você não praticar, eu te garanto que sua mente vai brincar com você, feliz e depois triste, animada e desanimada, mal humorada e depressiva, e depois excitada e sem controle, apenas seguindo o que sente. A meditação o ajuda a encontrar equilíbrio em sua vida. Por favor, entenda que equilíbrio vem de dentro, do relacionamento com sua própria mente, não tem nada a ver com o que acontece do lado de fora.\"",
              "author": "Phakchok Rinpoche",
              "order": 1
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
        final repository = QuotesViewModel(dio);
        tester.pumpWidget(
          ChangeNotifierProvider(
            create: (context) => QuotesViewModel(dio),
            child: Builder(
              builder: (context) {
                repository.loadQuotesFromPage(context, 1).then(
                  (_) {
                    expect(repository.quotes.isEmpty, equals(true));
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
        final repository = QuotesViewModel(dio);
        tester.pumpWidget(
          ChangeNotifierProvider(
            create: (context) => QuotesViewModel(dio),
            child: Builder(
              builder: (context) {
                repository.loadQuotesFromPage(context, 1).then(
                  (_) {
                    expect(repository.quotes.isNotEmpty, equals(true));
                    expect(repository.quotes[0].text != null, equals(true));
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
