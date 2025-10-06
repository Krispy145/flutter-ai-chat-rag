import "package:dio/dio.dart";
import "../config/env.dart";
import "interceptors.dart";

/// Factory for creating configured Dio instances
class HttpClientFactory {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: Env.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {"Content-Type": "application/json", "Accept": "application/json"},
      ),
    );

    // Add interceptors
    dio.interceptors.add(AuthInterceptor(() => Env.apiKey));
    dio.interceptors.add(PrettyLogInterceptor());

    return dio;
  }
}
