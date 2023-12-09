import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app/core/navigation/app_routes.dart';
import 'package:test_app/core/navigation/navigation_service.dart';
import 'package:test_app/core/utils/app_icons.dart';
import 'package:test_app/core/utils/extensions.dart';
import 'package:test_app/core/widgets/bottom_bar.dart';
import 'package:test_app/core/widgets/custom_app_bar.dart';
import 'package:test_app/features/login/services/cubits/login_cubit.dart';
import 'package:test_app/features/login/services/cubits/login_cubit_state.dart';
import 'package:test_app/features/profile/widgets/profile_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Профиль'),
      body: BlocBuilder<LoginCubit, LoginCubitState>(
        builder: (context, state) => state.when(
          init: () => const CircularProgressIndicator(),
          ready: (data) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 38.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppIcons.profileIcon,
                          height: 64.0,
                          width: 64.0,
                        ),
                        SizedBox(height: 15.0),
                        Text(
                          data.user?.nickname ?? 'Аноним',
                          style: context.textTheme.bodyLarge,
                        ),
                        if (data.user?.hasEmail ?? false) ...[
                          SizedBox(height: 12.0),
                          Text(
                            data.user!.email!,
                            style: context.textTheme.bodyMedium,
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(height: 27.0),
                  ProfileButton(
                    onPressed: () => _logout(context),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }

  void _logout(BuildContext context) async {
    await BlocProvider.of<LoginCubit>(context).logout().then((_) {
      context.goNamed(AppRoutes.login.name);
    });
  }
}
