import 'package:json_annotation/json_annotation.dart';

part 'barber_service.g.dart';

@JsonSerializable(explicitToJson: true)
class BarberServiceModel {
  String id;
  String title;
  int price;
  
  BarberServiceModel();

  factory BarberServiceModel.fromJson(Map<String, dynamic> json) => _$BarberServiceModelFromJson(json);

  Map<String, dynamic> toJson() => _$BarberServiceModelToJson(this);
}
