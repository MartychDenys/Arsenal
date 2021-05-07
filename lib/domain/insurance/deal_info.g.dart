// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealInfo _$DealInfoFromJson(Map<String, dynamic> json) {
  return DealInfo(
    id: json['ID'] as String,
    title: json['TITLE'] as String,
    beginDate: json['BEGINDATE'] as String,
    closeDate: json['CLOSEDATE'] as String,
    dmsLimit: json['UF_DMS_LIMIT'] as String,
  );
}

Map<String, dynamic> _$DealInfoToJson(DealInfo instance) => <String, dynamic>{
      'ID': instance.id,
      'TITLE': instance.title,
      'BEGINDATE': instance.beginDate,
      'CLOSEDATE': instance.closeDate,
      'UF_DMS_LIMIT': instance.dmsLimit,
    };
