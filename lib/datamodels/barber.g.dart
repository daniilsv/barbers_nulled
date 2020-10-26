// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barber.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarberModel _$BarberModelFromJson(Map<String, dynamic> json) {
  return BarberModel()
    ..id = json['id'] as String
    ..portfolio = (json['portfolio'] as List)?.map((e) => e as String)?.toList()
    ..orderPlace = json['orderPlace'] as String
    ..rating = (json['rating'] as num)?.toDouble()
    ..isActive = json['isActive'] as bool
    ..about = json['about'] as String
    ..userId = json['userId'] as String
    ..services = (json['services'] as List)
        ?.map((e) => e == null
            ? null
            : BarberServiceModel.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..user = json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BarberModelToJson(BarberModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'portfolio': instance.portfolio,
      'orderPlace': instance.orderPlace,
      'rating': instance.rating,
      'isActive': instance.isActive,
      'about': instance.about,
      'userId': instance.userId,
      'services': instance.services?.map((e) => e?.toJson())?.toList(),
      'user': instance.user?.toJson(),
    };
