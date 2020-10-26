// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallModel _$CallModelFromJson(Map<String, dynamic> json) {
  return CallModel()
    ..id = json['id'] as String
    ..byUser = json['byUser'] as bool
    ..createdAt = stringToDate(json['createdAt'] as String)
    ..barberId = json['barberId'] as String
    ..userId = json['userId'] as String
    ..user = json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>)
    ..barber = json['barber'] == null
        ? null
        : BarberModel.fromJson(json['barber'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CallModelToJson(CallModel instance) => <String, dynamic>{
      'id': instance.id,
      'byUser': instance.byUser,
      'createdAt': instance.createdAt?.toIso8601String(),
      'barberId': instance.barberId,
      'userId': instance.userId,
      'user': instance.user?.toJson(),
      'barber': instance.barber?.toJson(),
    };
