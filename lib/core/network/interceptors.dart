import "package:dio/dio.dart";

import "../utils/logger.dart";

/// Interceptor for adding authentication headers
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._getApiKey);
  final String Function() _getApiKey;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final apiKey = _getApiKey();
    if (apiKey.isNotEmpty) {
      options.headers["Authorization"] = "Bearer $apiKey";
    }
    handler.next(options);
  }
}

/// Interceptor for logging requests and responses
class PrettyLogInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.debug("🚀 REQUEST[${options.method}] => PATH: ${options.path}");
    AppLogger.debug("Headers: ${options.headers}");
    if (options.data != null) {
      AppLogger.debug("Data: ${options.data}");
    }
    handler.next(options);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    AppLogger.debug("✅ RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}");
    AppLogger.debug("Data: ${response.data}");
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.error("❌ ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}", err, err.stackTrace);
    handler.next(err);
  }
}
