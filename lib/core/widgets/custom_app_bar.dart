import 'package:flutter/material.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/core/utils/extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
      title: Text(
        title,
        style: context.textTheme.displaySmall?.copyWith(color: AppColors.blackColor),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
