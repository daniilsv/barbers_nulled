import 'package:barbers/app/converters.dart';
import 'package:barbers/datamodels/barber.dart';
import 'package:barbers/datamodels/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feedback.g.dart';

@JsonSerializable(explicitToJson: true)
class FeedbackModel {
  String id;

  double rating;

  String theme;

  String text;

  String userId;

  String barberId;

  @JsonKey(nullable: true)
  UserModel user;

  @JsonKey(nullable: true)
  BarberModel barber;

  @JsonKey(fromJson: stringToDate)
  DateTime createdAt;

  FeedbackModel();

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => _$FeedbackModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackModelToJson(this);
}
