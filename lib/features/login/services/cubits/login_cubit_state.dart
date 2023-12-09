import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_app/features/login/services/models/user.dart';

part 'login_cubit_state.freezed.dart';

@freezed
class LoginCubitState with _$LoginCubitState {
  const factory LoginCubitState.init() = _LoginCubitStateInit;

  const factory LoginCubitState.ready(LoginState data) = _LoginCubitStateReady;
}

class LoginState {
  final User? user;

  const LoginState({this.user});

  LoginState copyWith({User? user}) => LoginState(user: user ?? this.user);
}
