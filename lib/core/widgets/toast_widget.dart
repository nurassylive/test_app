import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/models/toast_message.dart';
import 'package:test_app/core/services/toast_dialog.dart';
import 'package:test_app/core/utils/app_colors.dart';
import 'package:test_app/core/utils/extensions.dart';

class ToastWidget extends StatelessWidget {
  final ToastMessage message;

  const ToastWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    if (message.message == null || message.message!.isEmpty) {
      return const SizedBox.shrink();
    }

    final theme = context.textTheme;

    return Positioned(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SafeArea(
          child: Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.up,
            child: Material(
              color: AppColors.backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: AppColors.primaryColor),
              ),
              child: GestureDetector(
                onTap: () => BlocProvider.of<ToastDialog>(context).hide(),
                child: Container(
                  width: context.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        message.message!,
                        style: theme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
