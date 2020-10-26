import 'package:barbers/app/converters.dart';
import 'package:barbers/datamodels/user.dart';
import 'package:json_annotation/json_annotation.dart';

import 'barber.dart';

part 'call.g.dart';

@JsonSerializable(explicitToJson: true)
class CallModel {
  String id;

  bool byUser;

  @JsonKey(fromJson: stringToDate)
  DateTime createdAt;

  String barberId;

  String userId;

  @JsonKey(nullable: true)
  UserModel user;

  @JsonKey(nullable: true)
  BarberModel barber;

  CallModel();

  factory CallModel.fromJson(Map<String, dynamic> json) => _$CallModelFromJson(json);

  Map<String, dynamic> toJson() => _$CallModelToJson(this);
}
