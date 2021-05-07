// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insurance_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsuranceData _$InsuranceDataFromJson(Map<String, dynamic> json) {
  return InsuranceData(
    dealInfo: json['DEAL_INFO'] == null
        ? null
        : DealInfo.fromJson(json['DEAL_INFO'] as Map<String, dynamic>),
    contactInfo: (json['CONTACT_INFO'] as List)
        ?.map((e) =>
            e == null ? null : ContactInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    dealProducts: (json['DEAL_PRODUCTS'] as List)
        ?.map((e) =>
            e == null ? null : DealProducts.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$InsuranceDataToJson(InsuranceData instance) =>
    <String, dynamic>{
      'DEAL_INFO': instance.dealInfo,
      'CONTACT_INFO': instance.contactInfo,
      'DEAL_PRODUCTS': instance.dealProducts,
    };
