import 'package:json_annotation/json_annotation.dart';

part 'contact_data.g.dart';

@JsonSerializable()
class ContactData {
  ContactData({
    this.id,
    this.name,
    this.lastName,
    this.secondName,
    this.birthDate,
    this.fullName,
    this.userCode,
    this.phone,
    this.mainContact,
  });

  /*factory ContactData.fromJson(Map<String, dynamic> json) {
    return ContactData(
      name: json['NAME'] as String,
      lastName: json['LAST_NAME'] as String,
      secondName: json['SECOND_NAME'] as String,
      birthDate: json['BIRTHDATE'] as String,
      fullName: json['FULL_NAME'] as String,
      phone: json['PHONE'] as String,
      userCode: json['UF_DMS_USER_CODE'] as String,
    );
  }*/

  factory ContactData.fromJson(Map<String, dynamic> json) =>
      _$ContactDataFromJson(json);

  Map<String, dynamic> toJson() => _$ContactDataToJson(this);

  @JsonKey(name: 'ID')
  final String id;
  @JsonKey(name: 'NAME')
  final String name;
  @JsonKey(name: 'LAST_NAME')
  final String lastName;
  @JsonKey(name: 'SECOND_NAME')
  final String secondName;
  @JsonKey(name: 'BIRTHDATE')
  final String birthDate;
  @JsonKey(name: 'FULL_NAME')
  final String fullName;
  @JsonKey(name: 'UF_DMS_USER_CODE')
  final String userCode;
  @JsonKey(name: 'PHONE')
  final String phone;
  @JsonKey(name: 'maincontact')
  final bool mainContact;
}
