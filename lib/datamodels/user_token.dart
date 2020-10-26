import 'package:barbers/datamodels/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_token.g.dart';

@JsonSerializable()
class UserTokenResponse {
  UserModel user;

  String token;

  UserTokenResponse();

  factory UserTokenResponse.fromJson(Map<String, dynamic> json) => _$UserTokenResponseFromJson(json);
}
