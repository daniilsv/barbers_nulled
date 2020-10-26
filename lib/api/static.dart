import 'package:barbers/datamodels/city.dart';
import 'package:barbers/datamodels/country.dart';
import 'package:barbers/datamodels/service.dart';
import 'package:barbers/env.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'static.g.dart';

@RestApi(baseUrl: Env.apiUrl)
abstract class StaticApi {
  factory StaticApi(Dio dio, {String baseUrl}) = _StaticApi;

  @GET('/geo/countries')
  Future<List<CountryModel>> getCountries();

  @GET('/geo/cities/{id}')
  Future<List<CityModel>> getCities(@Path("id") int id);

  @GET('/service/get')
  Future<List<ServiceModel>> getServices();
}
