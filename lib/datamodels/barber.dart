import 'package:barbers/datamodels/barber_service.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'barber.g.dart';

@JsonSerializable(explicitToJson: true)
class BarberModel {
  String id;
  List<String> portfolio;
  String orderPlace;
  double rating;
  bool isActive;
  String about;
  String userId;
  List<BarberServiceModel> services;
  UserModel user;

  BarberModel();

  factory BarberModel.fromJson(Map<String, dynamic> json) => _$BarberModelFromJson(json);

  Map<String, dynamic> toJson() => _$BarberModelToJson(this);
}
