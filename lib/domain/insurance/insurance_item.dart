import 'package:json_annotation/json_annotation.dart';

import 'insurance_data.dart';

part 'insurance_item.g.dart';

@JsonSerializable()
class InsuranceItem {
  InsuranceItem({
    this.data,
  });

  factory InsuranceItem.fromJson(Map<String, dynamic> json) =>
      _$InsuranceItemFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceItemToJson(this);

  final List<InsuranceData> data;
}
