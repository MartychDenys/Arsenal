import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exclusions.g.dart';

@JsonSerializable()
class Exclusions {
  Exclusions({
    @required this.id1C,
    @required this.name,
  });

  factory Exclusions.fromJson(Map<String, dynamic> json) =>
      _$ExclusionsFromJson(json);

  Map<String, dynamic> toJson() => _$ExclusionsToJson(this);

  @JsonKey(name: 'ID_1C')
  final String id1C;
  @JsonKey(name: 'NAME')
  final String name;
}
