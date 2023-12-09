import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:test_app/core/utils/keys.dart';

class DioClient {
  late final Dio _dio;
  static final DioClient _instance = DioClient._();

  DioClient._() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 10),
        contentType: 'application/json',
      ),
    )..interceptors.add(LogInterceptor());
  }

  static DioClient get instance => _instance;

  Future<dynamic> provideData(
    String endpoint, {
    Map<String, dynamic>? parameters,
    dynamic body,
    bool post = false,
    bool patch = false,
    bool delete = false,
    bool useAuthToken = true,
  }) async {
    try {
      Response<dynamic> response;
      if (body == null) {
        if (delete) {
          response = await _dio.delete(
            endpoint,
            queryParameters: parameters,
            options: Options(headers: {Keys.useAuthTokenHeader: useAuthToken}),
          );
        } else if (post) {
          response = await _dio.post(
            endpoint,
            queryParameters: parameters,
            options: Options(headers: {Keys.useAuthTokenHeader: useAuthToken}),
          );
        } else {
          response = await _dio.get(
            endpoint,
            queryParameters: parameters,
            options: Options(headers: {Keys.useAuthTokenHeader: useAuthToken}),
          );
        }
      } else {
        if (patch) {
          response = await _dio.patch(
            endpoint,
            data: body,
            options: Options(headers: {Keys.useAuthTokenHeader: useAuthToken}),
          );
        } else {
          response = await _dio.post(
            endpoint,
            data: body,
            queryParameters: parameters,
            options: Options(headers: {Keys.useAuthTokenHeader: useAuthToken}),
          );
        }
      }

      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('connection_timedout');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception('check_network_connection');
      } else {
        final message = e.response?.data['message'] ?? 'external_error';
        throw Exception(message);
      }
    } on Exception catch (e, s) {
      Logger().e(e.toString(), error: e, stackTrace: s, time: DateTime.now());
      rethrow;
    }
  }
}
