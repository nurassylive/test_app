// Project imports:
import 'package:test_app/core/services/secure_storage.dart';
import 'package:test_app/core/utils/constants.dart';
import 'package:test_app/features/login/services/providers/login_db_provider.dart';

class LoginDBProviderInject {
  static LoginDBProvider? _dbProvider;

  const LoginDBProviderInject._();

  static LoginDBProvider? loginDBProvider() => _dbProvider ??= LoginDBProviderImpl(
        secureStorage: getIt<SecureStorage>(),
      );
}
