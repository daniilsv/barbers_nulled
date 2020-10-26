// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenResponse _$UserTokenResponseFromJson(Map<String, dynamic> json) {
  return UserTokenResponse()
    ..user = json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>)
    ..token = json['token'] as String;
}

Map<String, dynamic> _$UserTokenResponseToJson(UserTokenResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
