import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/core/utils/extensions.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const LoginTextField({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      style: context.textTheme.titleMedium?.copyWith(color: AppColors.blackColor),
      cursorColor: AppColors.blackColor,
      keyboardType: keyboardType,
      validator: (value) => validator?.call(value),
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: context.textTheme.titleMedium?.copyWith(color: AppColors.secondaryTextColor),
        errorMaxLines: 1,
        filled: true,
        fillColor: AppColors.whiteColor,
        contentPadding: const EdgeInsets.symmetric(vertical: 19, horizontal: 16),
      ),
    );
  }
}
