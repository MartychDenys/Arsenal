import 'package:json_annotation/json_annotation.dart';
import 'phone_response.dart';

part 'phone_response_body.g.dart';

@JsonSerializable()
class PhoneResponseBody {
  const PhoneResponseBody({
    this.status,
    this.data,
  });

  factory PhoneResponseBody.fromJson(Map<String, dynamic> json) =>
      _$PhoneResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneResponseBodyToJson(this);

  final String status;
  final PhoneResponse data;
}
