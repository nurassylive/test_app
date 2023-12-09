import 'package:equatable/equatable.dart';

class AppResponse extends Equatable {
  final Object? object;
  final String? errorMessage;

  const AppResponse({this.object, this.errorMessage});

  factory AppResponse.success(Object? object) {
    return AppResponse(object: object);
  }

  factory AppResponse.withError(String? error) {
    return AppResponse(errorMessage: error);
  }

  @override
  List<Object?> get props => [object, errorMessage];
}
