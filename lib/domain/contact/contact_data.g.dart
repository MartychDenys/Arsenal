// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactData _$ContactDataFromJson(Map<String, dynamic> json) {
  return ContactData(
    id: json['ID'] as String,
    name: json['NAME'] as String,
    lastName: json['LAST_NAME'] as String,
    secondName: json['SECOND_NAME'] as String,
    birthDate: json['BIRTHDATE'] as String,
    fullName: json['FULL_NAME'] as String,
    userCode: json['UF_DMS_USER_CODE'] as String,
    phone: json['PHONE'] as String,
    mainContact: json['maincontact'] as bool,
  );
}

Map<String, dynamic> _$ContactDataToJson(ContactData instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'NAME': instance.name,
      'LAST_NAME': instance.lastName,
      'SECOND_NAME': instance.secondName,
      'BIRTHDATE': instance.birthDate,
      'FULL_NAME': instance.fullName,
      'UF_DMS_USER_CODE': instance.userCode,
      'PHONE': instance.phone,
      'maincontact': instance.mainContact,
    };
