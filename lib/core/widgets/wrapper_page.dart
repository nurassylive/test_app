import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/models/toast_message.dart';
import 'package:test_app/core/services/toast_dialog.dart';
import 'package:test_app/core/widgets/toast_widget.dart';

class WrapperPage extends StatelessWidget {
  final Widget child;

  const WrapperPage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        BlocBuilder<ToastDialog, ToastMessage>(
          builder: (context, state) => ToastWidget(message: state),
        )
      ],
    );
  }
}
