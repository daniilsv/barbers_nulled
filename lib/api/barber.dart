import 'package:barbers/datamodels/barber.dart';
import 'package:barbers/datamodels/barbers_filter.dart';
import 'package:barbers/datamodels/call.dart';
import 'package:barbers/datamodels/feedback.dart';
import 'package:barbers/datamodels/order.dart';
import 'package:barbers/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'barber.g.dart';

@RestApi(baseUrl: '${Env.apiUrl}/barber')
abstract class BarberApi {
  factory BarberApi(Dio dio, {String baseUrl}) = _BarberApi;

  @POST('/filter')
  Future<List<BarberModel>> filter(@Body() BarbersFilterDto body);

  @GET('/{id}/get')
  Future<BarberModel> byId(@Path() String id);

  @GET('/{id}/feedbacks')
  Future<List<FeedbackModel>> feedbacks(@Path() String id);

  @POST('/create')
  Future<BarberModel> create(
    @Field('about') String about,
    @Field('orderLocation') String orderLocation,
    @Field('portfolio') List<String> portfolio,
  );

  @POST('/my/edit')
  Future<BarberModel> edit(
    @Field('about') String about,
    @Field('orderLocation') String orderLocation,
    @Field('portfolio') List<String> portfolio,
  );

  @GET('/my/get')
  Future<BarberModel> my();

  @GET('/my/calls')
  Future<List<CallModel>> myCalls();

  @GET('/my/order/get')
  Future<List<OrderModel>> orders();

  @POST('/my/order/reply')
  Future<dynamic> reply({
    @Field('orderId') String orderId,
    @Field('status') String status,
  });

  @POST('/my/deleteSend')
  Future<dynamic> deleteSend();

  @POST('/my/deleteConfirm')
  Future<bool> deleteConfirm(
    @Field('code') String code,
  );

  @POST('/my/service/create')
  Future<dynamic> serviceCreate(
    @Field('serviceId') String serviceId,
    @Field('price') int price,
  );
  @POST('/my/service/remove')
  Future<dynamic> serviceRemove(
    @Field('serviceId') String serviceId,
  );
}
