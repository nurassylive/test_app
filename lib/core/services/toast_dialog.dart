// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/core/models/toast_message.dart';

// Project imports:

abstract class ToastDialog extends Cubit<ToastMessage> {
  ToastDialog(super.state);

  Future<void> show({
    required String message,
    String? title,
  });

  Future<void> hide();
}

@LazySingleton(as: ToastDialog)
class ToastDialogImpl extends ToastDialog {
  ToastDialogImpl() : super(const ToastMessage());

  @override
  Future<void> show({
    required String message,
    String? title,
  }) async {
    String formattedMessage = message;

    if (message.contains('Exception:')) {
      formattedMessage = message.replaceFirst('Exception:', '');
    }

    emit(ToastMessage(message: formattedMessage));

    await Future.delayed(Duration(seconds: 3)).then((_) {
      emit(const ToastMessage());
    });
  }

  @override
  Future<void> hide() async => emit(const ToastMessage());
}
