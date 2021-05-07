// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) {
  return ContactInfo(
    id: json['ID'] as String,
    name: json['NAME'] as String,
    lastName: json['LAST_NAME'] as String,
    secondName: json['SECOND_NAME'] as String,
    fullName: json['FULL_NAME'] as String,
    phone: json['PHONE'] as String,
    birthDate: json['BIRTHDATE'] as String,
    dmsUserCode: json['UF_DMS_USER_CODE'] as String,
  );
}

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      'LAST_NAME': instance.lastName,
      'SECOND_NAME': instance.secondName,
      'FULL_NAME': instance.fullName,
      'PHONE': instance.phone,
      'BIRTHDATE': instance.birthDate,
      'UF_DMS_USER_CODE': instance.dmsUserCode,
    };
