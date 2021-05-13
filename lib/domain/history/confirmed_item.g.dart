// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmed_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmedItem _$ConfirmedItemFromJson(Map<String, dynamic> json) {
  return ConfirmedItem(
    symptoms: json['SYMPTOMS'] as String,
    visitDate: json['VISIT_DATE'] as String,
    visitTime: json['VISIT_TIME'] as String,
    medInstitution: json['MEDICAL_INSTITUTION'] as String,
    doctorFio: json['DOCTOR_FIO'] as String,
    comment: json['COMMENT'] as String,
  );
}

Map<String, dynamic> _$ConfirmedItemToJson(ConfirmedItem instance) =>
    <String, dynamic>{
      'SYMPTOMS': instance.symptoms,
      'VISIT_DATE': instance.visitDate,
      'VISIT_TIME': instance.visitTime,
      'MEDICAL_INSTITUTION': instance.medInstitution,
      'DOCTOR_FIO': instance.doctorFio,
      'COMMENT': instance.comment,
    };
