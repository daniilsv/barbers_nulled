// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel()
    ..id = json['id'] as String
    ..birthday = json['birthday'] == null
        ? null
        : DateTime.parse(json['birthday'] as String)
    ..photo = json['photo'] as String
    ..name = json['name'] as String
    ..phone = json['phone'] as String
    ..frequency = json['frequency'] as String
    ..countryId = json['countryId'] as String
    ..cityId = json['cityId'] as String
    ..city = json['city'] == null
        ? null
        : CityModel.fromJson(json['city'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'birthday': instance.birthday?.toIso8601String(),
      'photo': instance.photo,
      'name': instance.name,
      'phone': instance.phone,
      'frequency': instance.frequency,
      'countryId': instance.countryId,
      'cityId': instance.cityId,
      'city': instance.city?.toJson(),
    };
