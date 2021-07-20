import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_info.g.dart';

@JsonSerializable()
class ContactInfo {
  ContactInfo({
    @required this.id,
    @required this.name,
    @required this.lastName,
    @required this.secondName,
    @required this.fullName,
    @required this.phone,
    @required this.birthDate,
    @required this.dmsUserCode,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);

  @JsonKey(name: 'ID')
  final String id;
  @JsonKey(name: 'NAME')
  final String name;
  @JsonKey(name: 'LAST_NAME')
  final String lastName;
  @JsonKey(name: 'SECOND_NAME')
  final String secondName;
  @JsonKey(name: 'FULL_NAME')
  final String fullName;
  @JsonKey(name: 'PHONE')
  final String phone;
  @JsonKey(name: 'BIRTHDATE')
  final String birthDate;
  @JsonKey(name: 'UF_DMS_USER_CODE')
  final String dmsUserCode;
}
