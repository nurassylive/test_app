import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@CopyWith()
class User extends Equatable {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;
  final String? email;
  final String? nickname;

  const User({
    required this.id,
    this.email,
    this.nickname,
  });

  bool get hasEmail => email != null && email!.isNotEmpty;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, email, nickname];
}
