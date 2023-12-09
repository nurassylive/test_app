import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:test_app/core/services/secure_storage.dart';
import 'package:test_app/core/utils/constants.dart';
import 'package:test_app/core/utils/keys.dart';

class LogInterceptor extends QueuedInterceptor {
  LogInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers[Keys.useAuthTokenHeader] as bool? ?? true) {
      final token = await getIt<SecureStorage>().getData(Keys.tokenKey);
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger().i(
      "Request: ${response.requestOptions.method} - ${response.requestOptions.path}\n${response.requestOptions.headers}\nResponse: ${response.data}",
    );
    return handler.next(response);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 304) {
      Logger().e(
        "ERROR: ${err.message}\n${err.requestOptions.method} - ${err.requestOptions.path}\n${err.requestOptions.headers}",
        error: err.error,
        stackTrace: err.stackTrace,
        time: DateTime.now(),
      );
    }
    return handler.next(err);
  }
}
