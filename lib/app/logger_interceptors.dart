import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'logger.dart';

class LoggerInterceptor implements InterceptorsWrapper {
  @override
  Future onError(DioError err) async => err;

  @override
  Future onRequest(RequestOptions options) async {
    final String headers = options.headers.entries.map((e) => '${e.key}: ${e.value}').join('\n');
    logger.i('-> ${options.method} ${options.uri}\n$headers');
    return options;
  }

  @override
  Future onResponse(Response response) async {
    final base = response.request;

    final String headers = base.headers.entries.map((e) => '<- ${e.key}: ${e.value}').join('\n');
    Level level = Level.info;
    if (response.statusCode >= 500) level = Level.debug;
    if (response.statusCode >= 400) level = Level.error;
    if (response.statusCode > 300) level = Level.warning;
    silentLogger.log(level, '<- ${response.statusCode} ${base.method} ${base.uri}\n$headers');
    // silentLogger.log(level, response.data);
    silentLogger.log(level, '<- END ${base.method}');
    return response;
  }
}
