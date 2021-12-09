// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      photourl: json['photourl'] as String?,
      mobileNo: json['mobileNo'] as String?,
      notification: json['notification'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'photourl': instance.photourl,
      'mobileNo': instance.mobileNo,
      'notification': instance.notification,
    };
