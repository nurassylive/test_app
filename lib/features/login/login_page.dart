import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/navigation/app_routes.dart';
import 'package:test_app/core/navigation/navigation_service.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/core/utils/constants.dart';
import 'package:test_app/core/widgets/custom_app_bar.dart';
import 'package:test_app/core/widgets/custom_button.dart';
import 'package:test_app/features/login/services/cubits/login_cubit.dart';
import 'package:test_app/features/login/widgets/login_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Авторизация'),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
              ),
              child: Column(
                children: [
                  LoginTextField(
                    controller: _loginController,
                    hintText: 'Логин или почта',
                    validator: emailValidator,
                  ),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFE0E6ED),
                    indent: 16.0,
                    endIndent: 16.0,
                  ),
                  LoginTextField(
                    controller: _passwordController,
                    obscureText: true,
                    hintText: 'Пароль',
                    validator: passwordValidator,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.0),
            CustomButton(
              title: 'Войти',
              onPressed: _login,
            ),
            SizedBox(height: 19.0),
            CustomButton(
              title: 'Зарегистрироваться',
              onPressed: _login,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    final success = await BlocProvider.of<LoginCubit>(context).login(email: _loginController.text, password: _passwordController.text);
    if (success) {
      context.goNamed(AppRoutes.profile.name);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
  }
}
