import 'package:barbers/app/converters.dart';
import 'package:barbers/datamodels/barber.dart';
import 'package:barbers/datamodels/barber_service.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'order.g.dart';

enum OrderStatus { waiting, cancelled, completed, rejected, accepted }

extension MyEnumExt on OrderStatus {
  String get toText => describeEnum(this);
}

@JsonSerializable(explicitToJson: true)
class OrderModel {
  String id;
  OrderStatus status;
  int amount;
  @JsonKey(fromJson: stringToDate)
  DateTime createdAt;
  String barberId;
  String serviceId;
  @JsonKey(nullable: true)
  UserModel user;
  @JsonKey(nullable: true)
  BarberModel barber;
  List<BarberServiceModel> services;

  OrderModel();

  factory OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
