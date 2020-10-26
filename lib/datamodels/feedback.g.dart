// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) {
  return FeedbackModel()
    ..id = json['id'] as String
    ..rating = (json['rating'] as num)?.toDouble()
    ..theme = json['theme'] as String
    ..text = json['text'] as String
    ..userId = json['userId'] as String
    ..barberId = json['barberId'] as String
    ..user = json['user'] == null
        ? null
        : UserModel.fromJson(json['user'] as Map<String, dynamic>)
    ..barber = json['barber'] == null
        ? null
        : BarberModel.fromJson(json['barber'] as Map<String, dynamic>)
    ..createdAt = stringToDate(json['createdAt'] as String);
}

Map<String, dynamic> _$FeedbackModelToJson(FeedbackModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'theme': instance.theme,
      'text': instance.text,
      'userId': instance.userId,
      'barberId': instance.barberId,
      'user': instance.user?.toJson(),
      'barber': instance.barber?.toJson(),
      'createdAt': instance.createdAt?.toIso8601String(),
    };
