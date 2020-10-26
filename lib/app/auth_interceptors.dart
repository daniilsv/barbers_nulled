import 'package:barbers/services/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthInterceptor implements InterceptorsWrapper {
  @override
  Future onError(DioError err) async => err;

  @override
  Future onRequest(RequestOptions options) async {
    final userService = Get.find<UserService>();
    if (userService == null) return options;
    if (userService.accessToken?.isNotEmpty ?? false) {
      options.headers['Authorization'] = userService.accessToken;
    }
    return options;
  }

  @override
  Future onResponse(Response response) async {
    return response;
  }
}
