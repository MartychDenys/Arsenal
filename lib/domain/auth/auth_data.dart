import 'package:json_annotation/json_annotation.dart';

import 'user_data.dart';

part 'auth_data.g.dart';

@JsonSerializable()
class AuthData {
  AuthData({
    this.status,
    this.data,
  });

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);

  final String status;
  final UserData data;
}
