import 'deal_info.dart';
import 'contact_info.dart';
import 'deal_products.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insurance_data.g.dart';

@JsonSerializable()
class InsuranceData {
  InsuranceData({
    @required this.dealInfo,
    @required this.contactInfo,
    @required this.dealProducts,
  });

  factory InsuranceData.fromJson(Map<String, dynamic> json) =>
      _$InsuranceDataFromJson(json);

  Map<String, dynamic> toJson() => _$InsuranceDataToJson(this);

  @JsonKey(name: 'DEAL_INFO')
  final DealInfo dealInfo;
  @JsonKey(name: 'CONTACT_INFO')
  final List<ContactInfo> contactInfo;
  @JsonKey(name: 'DEAL_PRODUCTS')
  final List<DealProducts> dealProducts;
}
