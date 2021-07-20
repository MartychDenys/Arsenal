import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'limits.g.dart';

@JsonSerializable()
class Limits {
  Limits({
    @required this.id1C,
    @required this.type,
    @required this.name,
    @required this.limitSum,
  });

  factory Limits.fromJson(Map<String, dynamic> json) => _$LimitsFromJson(json);

  Map<String, dynamic> toJson() => _$LimitsToJson(this);

  @JsonKey(name: 'ID_1C')
  final String id1C;
  @JsonKey(name: 'TYPE')
  final String type;
  @JsonKey(name: 'NAME')
  final String name;
  @JsonKey(name: 'LIMIT_SUMM')
  final String limitSum;
}
