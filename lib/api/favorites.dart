import 'package:barbers/datamodels/barber.dart';
import 'package:barbers/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'favorites.g.dart';

@RestApi(baseUrl: '${Env.apiUrl}/favorite')
abstract class FavoritesApi {
  factory FavoritesApi(Dio dio, {String baseUrl}) = _FavoritesApi;

  @GET('/get')
  Future<List<BarberModel>> getAll();

  @POST('/add')
  Future<dynamic> add(
    @Field('barberId') String barberId,
  );

  @POST('/remove')
  Future<dynamic> remove(
    @Field('barberId') String barberId,
  );
}
