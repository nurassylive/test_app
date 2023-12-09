import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/navigation/navigation_service.dart';
import 'package:test_app/core/services/toast_dialog.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/core/utils/constants.dart';
import 'package:test_app/features/login/services/cubits/login_cubit.dart';
import 'package:test_app/features/login/services/injections/login_repository_di.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final NavigationService _routerConfig = NavigationService();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ToastDialog>(create: (_) => getIt<ToastDialog>()),
        BlocProvider<LoginCubit>(
          create: (_) => LoginCubit(
            repository: LoginRepositoryInject.loginRepository()!,
            toastDialog: getIt<ToastDialog>(),
          ),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: const ColorScheme.light(
            primary: AppColors.primaryTextColor,
            secondary: AppColors.secondaryTextColor,
          ),
          indicatorColor: AppColors.blackColor,
          scaffoldBackgroundColor: AppColors.backgroundColor,
          appBarTheme: const AppBarTheme(color: AppColors.primaryTextColor),
          textTheme: TextTheme(
            displayLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600, color: AppColors.blackColor),
            displayMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700, color: AppColors.primaryTextColor),
            displaySmall: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
            titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            titleSmall: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w400),
          ),
        ),
        routerConfig: _routerConfig.router,
      ),
    );
  }
}
