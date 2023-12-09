import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

final regExpEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

String? emailValidator(String? val) {
  if (val == null || val.isEmpty) {
    return 'Введите вашу почту';
  }

  if (!regExpEmail.hasMatch(val)) {
    return 'Введите почту правильно';
  }

  return null;
}

String? passwordValidator(String? val) {
  if (val == null || val.isEmpty) {
    return 'Введите ваш пароль';
  }

  if (val.length <= 6) {
    return 'Пароль не должна быть меньше 6 букв';
  }

  return null;
}
