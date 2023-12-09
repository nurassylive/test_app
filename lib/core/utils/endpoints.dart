import 'package:test_app/core/models/environment_config.dart';

class Endpoints {
  Endpoints._();

  static final String _baseUrl = env!.baseUrl!;

  static final String login = '$_baseUrl/api/v1/auth/login';
  static final String registration = '$_baseUrl/api/v1/auth/registration/customer/new';
  static final String refresh = '$_baseUrl/api/v1/auth/login/refresh';
}
