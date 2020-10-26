import 'package:barbers/api/auth.dart';
import 'package:barbers/api/barber.dart';
import 'package:barbers/api/call.dart';
import 'package:barbers/api/favorites.dart';
import 'package:barbers/api/feedback.dart';
import 'package:barbers/api/media.dart';
import 'package:barbers/api/orders.dart';
import 'package:barbers/api/static.dart';
import 'package:barbers/api/users.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'auth_interceptors.dart';
import 'error_interceptor.dart';
import 'logger_interceptors.dart';

class AppApi {
  static void init() {
    final Dio dio = Dio()
      ..interceptors.addAll([
        AuthInterceptor(),
        LoggerInterceptor(),
        ErrorInterceptor(),
      ]);
    Get.put(dio);
    Get.put(AuthApi(dio));
    Get.put(BarberApi(dio));
    Get.put(CallApi(dio));
    Get.put(FavoritesApi(dio));
    Get.put(FeedbackApi(dio));
    Get.put(StaticApi(dio));
    Get.put(MediaApi(dio));
    Get.put(OrdersApi(dio));
    Get.put(UsersApi(dio));
  }
}
