import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deal_info.g.dart';

@JsonSerializable()
class DealInfo {
  DealInfo({
    @required this.id,
    @required this.title,
    @required this.beginDate,
    @required this.closeDate,
    @required this.dmsLimit,
  });

  factory DealInfo.fromJson(Map<String, dynamic> json) =>
      _$DealInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DealInfoToJson(this);

  @JsonKey(name: 'ID')
  final String id;
  @JsonKey(name: 'TITLE')
  final String title;
  @JsonKey(name: 'BEGINDATE')
  final String beginDate;
  @JsonKey(name: 'CLOSEDATE')
  final String closeDate;
  @JsonKey(name: 'UF_DMS_LIMIT')
  final String dmsLimit;
}
