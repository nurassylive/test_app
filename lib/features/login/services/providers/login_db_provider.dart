import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:test_app/core/services/secure_storage.dart';
import 'package:test_app/core/utils/keys.dart';
import 'package:test_app/features/login/services/models/auth_data.dart';
import 'package:test_app/features/login/services/models/main_user.dart';

abstract class LoginDBProvider {
  Future<MainUser?> getUser();
  Future<AuthData?> getAuthData();
  Future<void> storeUser(MainUser object);
  Future<void> clearData();
}

@LazySingleton(as: LoginDBProvider)
class LoginDBProviderImpl implements LoginDBProvider {
  final SecureStorage secureStorage;

  LoginDBProviderImpl({required this.secureStorage});

  @override
  Future<MainUser?> getUser() async {
    final rawUser = await secureStorage.getData(Keys.mainUserKey);
    if (rawUser != null) return MainUser.fromJson(json.decode(rawUser) as Map<String, dynamic>);
    return null;
  }

  @override
  Future<AuthData?> getAuthData() async {
    final rawUser = await secureStorage.getData(Keys.mainUserKey);
    if (rawUser != null) {
      final mainUser = MainUser.fromJson(json.decode(rawUser) as Map<String, dynamic>);
      return mainUser.authData!;
    }
    return null;
  }

  @override
  Future<void> storeUser(MainUser object) async {
    await secureStorage.putData(Keys.mainUserKey, json.encode(object.toJson()));
    await secureStorage.putData(Keys.tokenKey, object.authData!.accessToken);
    await secureStorage.putData(Keys.refreshTokenKey, object.authData!.refreshToken);

    Logger().w('TOKEN user_id ${object.user?.nickname} access_token >>>>> ${object.authData!.accessToken} <<<<<');
  }

  @override
  Future<void> clearData() async {
    await secureStorage.removeAllData();

    Logger().w('Logged out');
  }
}
