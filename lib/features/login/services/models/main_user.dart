import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test_app/features/login/services/models/auth_data.dart';
import 'package:test_app/features/login/services/models/user.dart';

part 'main_user.g.dart';

@JsonSerializable()
@CopyWith()
class MainUser extends Equatable {
  @JsonKey(name: 'tokens')
  final AuthData? authData;

  @JsonKey(name: 'user')
  final User? user;

  const MainUser({
    this.authData,
    this.user,
  });

  factory MainUser.fromJson(Map<String, dynamic> json) => _$MainUserFromJson(json);

  Map<String, dynamic> toJson() => _$MainUserToJson(this);

  @override
  List<Object?> get props => [authData, user];
}
