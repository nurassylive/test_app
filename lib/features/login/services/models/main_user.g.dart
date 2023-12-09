// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MainUserCWProxy {
  MainUser authData(AuthData? authData);

  MainUser user(User? user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MainUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MainUser(...).copyWith(id: 12, name: "My name")
  /// ````
  MainUser call({
    AuthData? authData,
    User? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMainUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMainUser.copyWith.fieldName(...)`
class _$MainUserCWProxyImpl implements _$MainUserCWProxy {
  const _$MainUserCWProxyImpl(this._value);

  final MainUser _value;

  @override
  MainUser authData(AuthData? authData) => this(authData: authData);

  @override
  MainUser user(User? user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MainUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MainUser(...).copyWith(id: 12, name: "My name")
  /// ````
  MainUser call({
    Object? authData = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return MainUser(
      authData: authData == const $CopyWithPlaceholder()
          ? _value.authData
          // ignore: cast_nullable_to_non_nullable
          : authData as AuthData?,
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User?,
    );
  }
}

extension $MainUserCopyWith on MainUser {
  /// Returns a callable class that can be used as follows: `instanceOfMainUser.copyWith(...)` or like so:`instanceOfMainUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MainUserCWProxy get copyWith => _$MainUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainUser _$MainUserFromJson(Map<String, dynamic> json) => MainUser(
      authData: json['tokens'] == null
          ? null
          : AuthData.fromJson(json['tokens'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MainUserToJson(MainUser instance) => <String, dynamic>{
      'tokens': instance.authData,
      'user': instance.user,
    };
