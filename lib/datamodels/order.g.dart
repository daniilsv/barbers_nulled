// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel()
    ..id = json['id'] as String
    ..status = _$enumDecodeNullable(_$OrderStatusEnumMap, json['status'])
    ..amount = json['amount'] as int
    ..createdAt = stringToDate(json['createdAt'] as String)
    ..barberId = json['barberId'] as String
    ..serviceId = json['serviceId'] as String
    ..user = json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>)
    ..barber = json['barber'] == null
        ? null
        : BarberModel.fromJson(json['barber'] as Map<String, dynamic>)
    ..services = (json['services'] as List)
        ?.map((e) => e == null
            ? null
            : BarberServiceModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status],
      'amount': instance.amount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'barberId': instance.barberId,
      'serviceId': instance.serviceId,
      'user': instance.user?.toJson(),
      'barber': instance.barber?.toJson(),
      'services': instance.services?.map((e) => e?.toJson())?.toList(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$OrderStatusEnumMap = {
  OrderStatus.waiting: 'waiting',
  OrderStatus.cancelled: 'cancelled',
  OrderStatus.completed: 'completed',
  OrderStatus.rejected: 'rejected',
  OrderStatus.accepted: 'accepted',
};
