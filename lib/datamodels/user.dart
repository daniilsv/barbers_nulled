import 'package:barbers/datamodels/city.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel {
  String id;

  DateTime birthday;

  String photo;

  String name;

  String phone;

  String frequency;

  String countryId;

  String cityId;

  @JsonKey(nullable: true)
  CityModel city;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
