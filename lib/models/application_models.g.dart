// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Users _$$_UsersFromJson(Map<String, dynamic> json) => _$_Users(
      id: json['id'] as String,
      email: json['email'] as String?,
      userName: json['userName'] as String?,
      photourl: json['photourl'] as String?,
      telegramId: json['telegramId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      emailVerified: json['emailVerified'] as String?,
    );

Map<String, dynamic> _$$_UsersToJson(_$_Users instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'userName': instance.userName,
      'photourl': instance.photourl,
      'telegramId': instance.telegramId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'emailVerified': instance.emailVerified,
    };
