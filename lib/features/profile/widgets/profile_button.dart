import 'package:flutter/material.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/core/utils/extensions.dart';

class ProfileButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ProfileButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed?.call(),
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: context.width,
        height: 55.0,
        color: AppColors.whiteColor,
        padding: EdgeInsets.symmetric(horizontal: 29.0),
        alignment: Alignment.centerLeft,
        child: Text(
          'Выйти',
          style: context.textTheme.titleMedium?.copyWith(color: AppColors.errorColor),
        ),
      ),
    );
  }
}
