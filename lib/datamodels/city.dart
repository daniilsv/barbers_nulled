import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable(explicitToJson: true)
class CityModel {
  String id;
  String name;

  CityModel();

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
