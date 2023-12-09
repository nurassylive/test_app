// Project imports:
import 'package:test_app/features/login/services/injections/login_api_provider_di.dart';
import 'package:test_app/features/login/services/injections/login_db_provider_di.dart';
import 'package:test_app/features/login/services/repositories/login_repository.dart';

class LoginRepositoryInject {
  static LoginRepository? _loginRepository;

  const LoginRepositoryInject._();

  static LoginRepository? loginRepository() {
    return _loginRepository ??= LoginRepositoryImpl(
      apiProvider: LoginApiProviderInject.loginApiProvider()!,
      dbProvider: LoginDBProviderInject.loginDBProvider()!,
    );
  }
}
