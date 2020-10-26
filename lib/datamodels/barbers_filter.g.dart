// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barbers_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarbersFilterDto _$BarbersFilterDtoFromJson(Map<String, dynamic> json) {
  return BarbersFilterDto()
    ..serviceId = json['serviceId'] as String
    ..countryId = json['countryId'] as String
    ..cityId = json['cityId'] as String
    ..orderPlace = json['orderPlace'] as String
    ..page = json['page'] as int
    ..pageSize = json['pageSize'] as int;
}

Map<String, dynamic> _$BarbersFilterDtoToJson(BarbersFilterDto instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'countryId': instance.countryId,
      'cityId': instance.cityId,
      'orderPlace': instance.orderPlace,
      'page': instance.page,
      'pageSize': instance.pageSize,
    };
