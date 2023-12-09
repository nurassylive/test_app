import 'package:flutter/material.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/core/utils/extensions.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final Function()? onPressed;

  const CustomButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _loading = false;

  Future<void> _onPressed() async {
    if (widget.onPressed == null) return;
    if (_loading) {
      return;
    }
    setState(() => _loading = true);
    try {
      await widget.onPressed!.call();
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Container(
        height: 64.0,
        width: context.width * 0.9,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: AppColors.primaryColor,
        ),
        child: _loading
            ? const CircularProgressIndicator()
            : Text(
                widget.title,
                style: context.textTheme.displayMedium,
              ),
      ),
    );
  }
}
