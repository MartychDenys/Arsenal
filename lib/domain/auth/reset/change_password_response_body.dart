import 'package:json_annotation/json_annotation.dart';
import 'change_password_response.dart';

part 'change_password_response_body.g.dart';

@JsonSerializable()
class ChangePasswordResponseBody {
  const ChangePasswordResponseBody({
    this.status,
    this.data,
  });

  factory ChangePasswordResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ChangePasswordResponseBodyToJson(this);

  final String status;
  final ChangePasswordResponse data;
}
