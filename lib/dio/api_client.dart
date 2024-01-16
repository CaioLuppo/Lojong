import "package:chucker_flutter/chucker_flutter.dart";
import "package:dio/dio.dart";
import "package:dio_cache_interceptor/dio_cache_interceptor.dart";

class Client {
  final _token = "O7Kw5E2embxod5YtL1h1YsGNN7FFN8wIxPYMg6J9zFjE6Th9oDssEsFLVhxf";
  static final Dio _dio = Dio();

  Dio init() {
    _dio.options.baseUrl = "https://applojong.com/api";
    _dio.options.headers = {
      "Authorization": "Bearer $_token",
    };
    final options = CacheOptions(
      store: MemCacheStore(),
      policy: CachePolicy.refreshForceCache,
      hitCacheOnErrorExcept: [401, 404],
      maxStale: const Duration(days: 7),
    );
    _dio.interceptors.add(DioCacheInterceptor(options: options));
    _dio.interceptors.add(ChuckerDioInterceptor());
    return _dio;
  }
}

