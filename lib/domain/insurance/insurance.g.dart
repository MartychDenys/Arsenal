// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Insurance _$InsuranceFromJson(Map<String, dynamic> json) {
  return Insurance(
    status: json['status'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : InsuranceItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InsuranceToJson(Insurance instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
