// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceItem _$InsuranceItemFromJson(Map<String, dynamic> json) {
  return InsuranceItem(
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : InsuranceData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InsuranceItemToJson(InsuranceItem instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
