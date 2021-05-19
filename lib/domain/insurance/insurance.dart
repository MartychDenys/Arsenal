import 'package:json_annotation/json_annotation.dart';
import 'insurance_item.dart';

import 'insurance_data.dart';

part 'insurance.g.dart';

@JsonSerializable()
class Insurance {
  Insurance({
    this.status,
    this.data,
  });

  factory Insurance.fromJson(Map<String, dynamic> json) =>
      _$InsuranceFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceToJson(this);

  final String status;
  final List<InsuranceData> data;
}
