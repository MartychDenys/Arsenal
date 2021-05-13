// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmed_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmedList _$ConfirmedListFromJson(Map<String, dynamic> json) {
  return ConfirmedList(
    status: json['status'] as String,
    data: (json['data'] as List)
        ?.map((e) => e == null
            ? null
            : ConfirmedItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ConfirmedListToJson(ConfirmedList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
