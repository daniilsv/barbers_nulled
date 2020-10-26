import 'package:barbers/datamodels/user_token.dart';
import 'package:barbers/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth.g.dart';

@RestApi(baseUrl: '${Env.apiUrl}/auth')
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('/send')
  Future<dynamic> send(
    @Field('phone') String phone,
  );

  @POST('/confirm')
  Future<UserTokenResponse> confirm(
    @Field('phone') String phone,
    @Field('code') String code,
  );
}
