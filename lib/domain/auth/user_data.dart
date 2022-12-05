import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  UserData(
    this.message,
    this.id,
    this.token,
    this.refreshToken,
  );

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

  final String message;
  final String id;
  @JsonKey(name: '_token')
  final String token;
  @JsonKey(name: '_refresh_token')
  final String refreshToken;
}
