// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barber_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarberServiceModel _$BarberServiceModelFromJson(Map<String, dynamic> json) {
  return BarberServiceModel()
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..price = json['price'] as int;
}

Map<String, dynamic> _$BarberServiceModelToJson(BarberServiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
    };
