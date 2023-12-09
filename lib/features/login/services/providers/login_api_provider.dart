// ignore_for_file: avoid_dynamic_calls

import 'dart:convert';
import 'dart:developer';

import 'package:test_app/core/client/dio_client.dart';
import 'package:test_app/core/utils/endpoints.dart';
import 'package:test_app/features/login/services/models/main_user.dart';

abstract class LoginApiProvider {
  Future<MainUser> login({required String email, required String password});
}

class LoginApiProviderImpl implements LoginApiProvider {
  @override
  Future<MainUser> login({required String email, required String password}) async {
    final body = {
      "email": email,
      "password": password,
    };

    final object = await DioClient.instance.provideData(
      Endpoints.login,
      body: json.encode(body),
      useAuthToken: false,
      post: true,
    );

    log('NURIK: object - $object');

    return MainUser.fromJson(object as Map<String, dynamic>);
  }
}
