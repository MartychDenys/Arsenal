import 'package:json_annotation/json_annotation.dart';
import 'phone_response.dart';

part 'sms_response_body.g.dart';

@JsonSerializable()
class SmsResponseBody {
  const SmsResponseBody({
    this.status,
    this.data,
  });

  factory SmsResponseBody.fromJson(Map<String, dynamic> json) =>
      _$SmsResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$SmsResponseBodyToJson(this);

  final String status;
  final PhoneResponse data;
}
