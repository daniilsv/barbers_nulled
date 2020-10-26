import 'dart:io';

import 'package:barbers/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'media.g.dart';

@RestApi(baseUrl: '${Env.apiUrl}/media')
abstract class MediaApi {
  factory MediaApi(Dio dio, {String baseUrl}) = _MediaApi;

  @POST("/upload")
  Future<String> upload(@Part() File files);
}
