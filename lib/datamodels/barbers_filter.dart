import 'package:json_annotation/json_annotation.dart';

part 'barbers_filter.g.dart';

@JsonSerializable(explicitToJson: true)
class BarbersFilterDto {
  @JsonKey(nullable: true)
  String serviceId;

  @JsonKey(nullable: true)
  String countryId;

  @JsonKey(nullable: true)
  String cityId;

  @JsonKey(nullable: true)
  String orderPlace;

  @JsonKey(nullable: true)
  int page;

  @JsonKey(nullable: true)
  int pageSize;
  
  BarbersFilterDto();

  Map<String, dynamic> toJson() => _$BarbersFilterDtoToJson(this);
}
