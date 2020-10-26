import 'package:barbers/datamodels/order.dart';
import 'package:barbers/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'orders.g.dart';

@RestApi(baseUrl: '${Env.apiUrl}/order')
abstract class OrdersApi {
  factory OrdersApi(Dio dio, {String baseUrl}) = _OrdersApi;

  @GET('/my')
  Future<List<OrderModel>> my();

  @POST('/create')
  Future<dynamic> create(
    @Field('barberId') String barberId,
    @Field('services') List<String> services,
  );

  @POST('/cancel')
  Future<dynamic> cancel(
    @Field('orderId') String orderId,
  );
}
