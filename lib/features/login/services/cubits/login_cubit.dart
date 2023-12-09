import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/services/toast_dialog.dart';
import 'package:test_app/features/login/services/cubits/login_cubit_state.dart';
import 'package:test_app/features/login/services/models/user.dart';
import 'package:test_app/features/login/services/repositories/login_repository.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final LoginRepository repository;
  final ToastDialog toastDialog;

  LoginCubit({
    required this.repository,
    required this.toastDialog,
  }) : super(const LoginCubitState.init());

  LoginState _current = const LoginState();

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final data = await repository.login(email: email, password: password);

    if (data.object != null) {
      final user = data.object as User;
      _current = _current.copyWith(user: user);

      emit(LoginCubitState.ready(_current));
      return true;
    }

    print('NURIK: login - ${data.errorMessage}');

    toastDialog.show(message: data.errorMessage ?? 'Internal error');

    return false;
  }

  Future<void> logout() async {
    await repository.logout();
  }
}
