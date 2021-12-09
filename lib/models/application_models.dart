import 'package:freezed_annotation/freezed_annotation.dart';
part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
class Users with _$Users {
  Users._();

  factory Users({
    required String id,
    String? email,
    String? name,
    String? photourl,
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
