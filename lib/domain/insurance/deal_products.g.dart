// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealProducts _$DealProductsFromJson(Map<String, dynamic> json) {
  return DealProducts(
    name: json['NAME'] as String,
    price: json['PRICE'] as String,
  );
}

Map<String, dynamic> _$DealProductsToJson(DealProducts instance) =>
    <String, dynamic>{
      'NAME': instance.name,
      'PRICE': instance.price,
    };
