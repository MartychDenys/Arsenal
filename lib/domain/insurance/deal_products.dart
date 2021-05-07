import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'limits.dart';

part 'deal_products.g.dart';

@JsonSerializable()
class DealProducts {
  DealProducts({
    @required this.name,
    @required this.price,
  });

  factory DealProducts.fromJson(Map<String, dynamic> json) =>
      _$DealProductsFromJson(json);

  Map<String, dynamic> toJson() => _$DealProductsToJson(this);

  @JsonKey(name: 'NAME')
  final String name;
  @JsonKey(name: 'PRICE')
  final String price;
}
