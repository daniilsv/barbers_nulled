import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorInterceptor implements InterceptorsWrapper {
  @override
  Future onError(DioError err) async {
    if (err.response.data['message'] != null) {
      Get.rawSnackbar(
        title: 'Ошибка',
        message: err.response.data['message'].toString(),
        backgroundColor: Colors.red,
      );
    }
    return null;
  }

  @override
  Future onRequest(RequestOptions options) async {
    return options;
  }

  @override
  Future onResponse(Response response) async {
    return response;
  }
}
