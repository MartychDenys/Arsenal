import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctor_item.g.dart';

@JsonSerializable()
class DoctorItem {
  DoctorItem({
    @required this.symptoms,
    @required this.visitDate,
    @required this.visitTimeFrom,
    @required this.visitTimeTo,
    @required this.medInstitution,
    @required this.sickList,
    @required this.comment,
  });

  factory DoctorItem.fromJson(Map<String, dynamic> json) =>
      _$DoctorItemFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorItemToJson(this);

  @JsonKey(name: 'SYMPTOMS')
  final String symptoms;
  @JsonKey(name: 'VISIT_DATE')
  final String visitDate;
  @JsonKey(name: 'VISIT_TIME_FROM')
  final String visitTimeFrom;
  @JsonKey(name: 'VISIT_TIME_TO')
  final String visitTimeTo;
  @JsonKey(name: 'MEDICAL_INSTITUTION')
  final String medInstitution;
  @JsonKey(name: 'SICK_LIST_REQ')
  final bool sickList;
  @JsonKey(name: 'COMMENT')
  final String comment;
}
