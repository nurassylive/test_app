// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthDataCWProxy {
  AuthData accessToken(String? accessToken);

  AuthData refreshToken(String? refreshToken);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthData(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthData call({
    String? accessToken,
    String? refreshToken,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthData.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthData.copyWith.fieldName(...)`
class _$AuthDataCWProxyImpl implements _$AuthDataCWProxy {
  const _$AuthDataCWProxyImpl(this._value);

  final AuthData _value;

  @override
  AuthData accessToken(String? accessToken) => this(accessToken: accessToken);

  @override
  AuthData refreshToken(String? refreshToken) =>
      this(refreshToken: refreshToken);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthData(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthData(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthData call({
    Object? accessToken = const $CopyWithPlaceholder(),
    Object? refreshToken = const $CopyWithPlaceholder(),
  }) {
    return AuthData(
      accessToken: accessToken == const $CopyWithPlaceholder()
          ? _value.accessToken
          // ignore: cast_nullable_to_non_nullable
          : accessToken as String?,
      refreshToken: refreshToken == const $CopyWithPlaceholder()
          ? _value.refreshToken
          // ignore: cast_nullable_to_non_nullable
          : refreshToken as String?,
    );
  }
}

extension $AuthDataCopyWith on AuthData {
  /// Returns a callable class that can be used as follows: `instanceOfAuthData.copyWith(...)` or like so:`instanceOfAuthData.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthDataCWProxy get copyWith => _$AuthDataCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
    );

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
