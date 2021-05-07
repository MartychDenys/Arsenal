// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthData _$AuthDataFromJson(Map<String, dynamic> json) {
  return AuthData(
    status: json['status'] as String,
    data: json['data'] == null
        ? null
        : UserData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
