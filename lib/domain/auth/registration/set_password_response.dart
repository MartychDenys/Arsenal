import 'package:json_annotation/json_annotation.dart';

part 'set_password_response.g.dart';

@JsonSerializable()
class SetPasswordResponse {
  const SetPasswordResponse({
    this.message,
  });

  factory SetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$SetPasswordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SetPasswordResponseToJson(this);

  final String message;
}
