import 'package:barbers/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'call.g.dart';

@RestApi(baseUrl: '${Env.apiUrl}/call')
abstract class CallApi {
  factory CallApi(Dio dio, {String baseUrl}) = _CallApi;

  @POST('/barber')
  Future<dynamic> barber(
    @Field('barberId') String barberId,
  );
}
