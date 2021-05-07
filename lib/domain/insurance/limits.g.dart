// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'limits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Limits _$LimitsFromJson(Map<String, dynamic> json) {
  return Limits(
    id1C: json['ID_1C'] as String,
    type: json['TYPE'] as String,
    name: json['NAME'] == null
        ? null
        : Limits.fromJson(json['NAME'] as Map<String, dynamic>),
    limitSum: json['LIMIT_SUMM'] == null
        ? null
        : Limits.fromJson(json['LIMIT_SUMM'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LimitsToJson(Limits instance) => <String, dynamic>{
      'ID_1C': instance.id1C,
      'TYPE': instance.type,
      'NAME': instance.name,
      'LIMIT_SUMM': instance.limitSum,
    };
