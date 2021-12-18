// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'application_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Users _$UsersFromJson(Map<String, dynamic> json) {
  return _Users.fromJson(json);
}

/// @nodoc
class _$UsersTearOff {
  const _$UsersTearOff();

  _Users call(
      {required String id,
      String? email,
      String? userName,
      String? photourl,
      String? telegramId,
      String? createdAt,
      String? updatedAt,
      String? emailVerified}) {
    return _Users(
      id: id,
      email: email,
      userName: userName,
      photourl: photourl,
      telegramId: telegramId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      emailVerified: emailVerified,
    );
  }

  Users fromJson(Map<String, Object> json) {
    return Users.fromJson(json);
  }
}

/// @nodoc
const $Users = _$UsersTearOff();

/// @nodoc
mixin _$Users {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get userName => throw _privateConstructorUsedError;
  String? get photourl => throw _privateConstructorUsedError;
  String? get telegramId => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  String? get emailVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersCopyWith<Users> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersCopyWith<$Res> {
  factory $UsersCopyWith(Users value, $Res Function(Users) then) =
      _$UsersCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? email,
      String? userName,
      String? photourl,
      String? telegramId,
      String? createdAt,
      String? updatedAt,
      String? emailVerified});
}

/// @nodoc
class _$UsersCopyWithImpl<$Res> implements $UsersCopyWith<$Res> {
  _$UsersCopyWithImpl(this._value, this._then);

  final Users _value;
  // ignore: unused_field
  final $Res Function(Users) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? userName = freezed,
    Object? photourl = freezed,
    Object? telegramId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? emailVerified = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      photourl: photourl == freezed
          ? _value.photourl
          : photourl // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramId: telegramId == freezed
          ? _value.telegramId
          : telegramId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$UsersCopyWith<$Res> implements $UsersCopyWith<$Res> {
  factory _$UsersCopyWith(_Users value, $Res Function(_Users) then) =
      __$UsersCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? email,
      String? userName,
      String? photourl,
      String? telegramId,
      String? createdAt,
      String? updatedAt,
      String? emailVerified});
}

/// @nodoc
class __$UsersCopyWithImpl<$Res> extends _$UsersCopyWithImpl<$Res>
    implements _$UsersCopyWith<$Res> {
  __$UsersCopyWithImpl(_Users _value, $Res Function(_Users) _then)
      : super(_value, (v) => _then(v as _Users));

  @override
  _Users get _value => super._value as _Users;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? userName = freezed,
    Object? photourl = freezed,
    Object? telegramId = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? emailVerified = freezed,
  }) {
    return _then(_Users(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      photourl: photourl == freezed
          ? _value.photourl
          : photourl // ignore: cast_nullable_to_non_nullable
              as String?,
      telegramId: telegramId == freezed
          ? _value.telegramId
          : telegramId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: emailVerified == freezed
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Users extends _Users {
  _$_Users(
      {required this.id,
      this.email,
      this.userName,
      this.photourl,
      this.telegramId,
      this.createdAt,
      this.updatedAt,
      this.emailVerified})
      : super._();

  factory _$_Users.fromJson(Map<String, dynamic> json) =>
      _$$_UsersFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? userName;
  @override
  final String? photourl;
  @override
  final String? telegramId;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final String? emailVerified;

  @override
  String toString() {
    return 'Users(id: $id, email: $email, userName: $userName, photourl: $photourl, telegramId: $telegramId, createdAt: $createdAt, updatedAt: $updatedAt, emailVerified: $emailVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Users &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.userName, userName) ||
                const DeepCollectionEquality()
                    .equals(other.userName, userName)) &&
            (identical(other.photourl, photourl) ||
                const DeepCollectionEquality()
                    .equals(other.photourl, photourl)) &&
            (identical(other.telegramId, telegramId) ||
                const DeepCollectionEquality()
                    .equals(other.telegramId, telegramId)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.updatedAt, updatedAt)) &&
            (identical(other.emailVerified, emailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.emailVerified, emailVerified)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(userName) ^
      const DeepCollectionEquality().hash(photourl) ^
      const DeepCollectionEquality().hash(telegramId) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt) ^
      const DeepCollectionEquality().hash(emailVerified);

  @JsonKey(ignore: true)
  @override
  _$UsersCopyWith<_Users> get copyWith =>
      __$UsersCopyWithImpl<_Users>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersToJson(this);
  }
}

abstract class _Users extends Users {
  factory _Users(
      {required String id,
      String? email,
      String? userName,
      String? photourl,
      String? telegramId,
      String? createdAt,
      String? updatedAt,
      String? emailVerified}) = _$_Users;
  _Users._() : super._();

  factory _Users.fromJson(Map<String, dynamic> json) = _$_Users.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get userName => throw _privateConstructorUsedError;
  @override
  String? get photourl => throw _privateConstructorUsedError;
  @override
  String? get telegramId => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  String? get emailVerified => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UsersCopyWith<_Users> get copyWith => throw _privateConstructorUsedError;
}
