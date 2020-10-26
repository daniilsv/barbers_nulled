import 'package:barbers/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'feedback.g.dart';

@RestApi(baseUrl: '${Env.apiUrl}/feedback')
abstract class FeedbackApi {
  factory FeedbackApi(Dio dio, {String baseUrl}) = _FeedbackApi;

  @POST('/send')
  Future<dynamic> send({
    @Field('theme') String theme,
    @Field('text') String text,
    @Field('rating') String rating,
    @Field('barberId') String barberId,
  });
}
