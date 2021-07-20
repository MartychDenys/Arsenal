import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirmed_item.g.dart';

@JsonSerializable()
class ConfirmedItem {
  ConfirmedItem({
    @required this.symptoms,
    @required this.visitDate,
    @required this.visitTime,
    @required this.medInstitution,
    @required this.doctorFio,
    @required this.comment,
  });

  factory ConfirmedItem.fromJson(Map<String, dynamic> json) =>
      _$ConfirmedItemFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmedItemToJson(this);

  @JsonKey(name: 'SYMPTOMS')
  final String symptoms;
  @JsonKey(name: 'VISIT_DATE')
  final String visitDate;
  @JsonKey(name: 'VISIT_TIME')
  final String visitTime;
  @JsonKey(name: 'MEDICAL_INSTITUTION')
  final String medInstitution;
  @JsonKey(name: 'DOCTOR_FIO')
  final String doctorFio;
  @JsonKey(name: 'COMMENT')
  final String comment;
}
