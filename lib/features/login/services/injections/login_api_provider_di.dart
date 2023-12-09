// Project imports:
import 'package:test_app/features/login/services/providers/login_api_provider.dart';

class LoginApiProviderInject {
  static LoginApiProvider? _apiProvider;

  const LoginApiProviderInject._();

  static LoginApiProvider? loginApiProvider() => _apiProvider ??= LoginApiProviderImpl();
}
