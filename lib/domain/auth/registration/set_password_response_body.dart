import 'package:json_annotation/json_annotation.dart';
import 'set_password_response.dart';

part 'set_password_response_body.g.dart';

@JsonSerializable()
class SetPasswordResponseBody {
  const SetPasswordResponseBody({
    this.status,
    this.data,
  });

  factory SetPasswordResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SetPasswordResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SetPasswordResponseBodyToJson(this);

  final String status;
  final SetPasswordResponse data;
}
