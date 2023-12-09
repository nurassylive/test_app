// Package imports:
import 'package:equatable/equatable.dart';

class ToastMessage extends Equatable {
  final String? message;

  const ToastMessage({
    this.message,
  });

  @override
  List<Object?> get props => [message];
}
