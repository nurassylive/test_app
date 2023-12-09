import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_data.g.dart';

@JsonSerializable()
@CopyWith()
class AuthData extends Equatable {
  final String? accessToken;
  final String? refreshToken;

  const AuthData({
    this.accessToken,
    this.refreshToken,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) => _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
