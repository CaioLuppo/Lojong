import "package:dio/dio.dart";
import "package:dio_cache_interceptor/dio_cache_interceptor.dart";
import "package:flutter/widgets.dart";

class Client {
  final _token = "O7Kw5E2embxod5YtL1h1YsGNN7FFN8wIxPYMg6J9zFjE6Th9oDssEsFLVhxf";
  static final Dio dio = Dio();

  Dio init() {
    dio.options.baseUrl = "https://applojong.com/api";
    dio.options.headers = {
      "Authorization": "Bearer $_token",
    };
    final options = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.forceCache,
      priority: CachePriority.high,
      hitCacheOnErrorExcept: [401, 404],
      maxStale: const Duration(days: 7),
    );
    dio.interceptors.add(DioCacheInterceptor(options: options));
    dio.interceptors.add(ApiInterceptors());
    return dio;
  }
}

class ApiInterceptors extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("DIO ERROR:\n$err");
    super.onError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("DIO REQUEST:\n${options.toString()}");

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("DIO RESPONSE:\n${response.data}");
    super.onResponse(response, handler);
  }
}
