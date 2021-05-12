import 'package:json_annotation/json_annotation.dart';

import 'contact_data.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  Contact({
    this.status,
    this.data,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  final String status;
  final List<ContactData> data;
}
