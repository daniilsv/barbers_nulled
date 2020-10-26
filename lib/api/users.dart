import 'package:barbers/datamodels/user.dart';
import 'package:barbers/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'users.g.dart';

@RestApi(baseUrl: '${Env.apiUrl}/user')
abstract class UsersApi {
  factory UsersApi(Dio dio, {String baseUrl}) = _UsersApi;

  @GET('/me')
  Future<UserModel> getInfo();

  @POST('/edit')
  Future<UserModel> setInfo(@Body() UserModel user);

  @POST('/deleteSend')
  Future<dynamic> deleteSend();

  @POST('/deleteConfirm')
  Future<bool> deleteConfirm(
    @Field('code') String code,
  );

  @POST('/fcm')
  Future<dynamic> sendFcm(
    @Field('fcmToken') String fcmToken,
  );
}
