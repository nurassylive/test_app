import 'package:test_app/core/models/app_response.dart';
import 'package:logger/logger.dart';
import 'package:test_app/features/login/services/providers/login_api_provider.dart';
import 'package:test_app/features/login/services/providers/login_db_provider.dart';

abstract class LoginRepository {
  Future<AppResponse> login({required String email, required String password});
  Future<void> logout();
}

class LoginRepositoryImpl extends LoginRepository {
  final LoginApiProvider apiProvider;
  final LoginDBProvider dbProvider;

  LoginRepositoryImpl({
    required this.apiProvider,
    required this.dbProvider,
  });

  @override
  Future<AppResponse> login({required String email, required String password}) async {
    try {
      final data = await apiProvider.login(email: email, password: password);
      await dbProvider.storeUser(data);
      return AppResponse.success(data.user);
    } on Exception catch (e, s) {
      Logger().e(e.toString(), error: e, stackTrace: s);
      return AppResponse.withError(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      await dbProvider.clearData();
    } on Exception catch (e, s) {
      Logger().e(e.toString(), error: e, stackTrace: s);
    }
  }
}
