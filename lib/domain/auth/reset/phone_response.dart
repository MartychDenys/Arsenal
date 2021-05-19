import 'package:json_annotation/json_annotation.dart';

part 'phone_response.g.dart';

@JsonSerializable()
class PhoneResponse {
  const PhoneResponse({
    this.message,
    this.token,
  });

  factory PhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$PhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PhoneResponseToJson(this);

  final String message;
  @JsonKey(name: '_token')
  final String token;
}
