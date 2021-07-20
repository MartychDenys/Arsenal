import 'limits.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'exclusions.dart';

part 'deal_products.g.dart';

@JsonSerializable()
class DealProducts {
  DealProducts({
    @required this.name,
    @required this.price,
    @required this.limits,
    @required this.exclusions,
  });

  factory DealProducts.fromJson(Map<String, dynamic> json) =>
      _$DealProductsFromJson(json);

  Map<String, dynamic> toJson() => _$DealProductsToJson(this);

  @JsonKey(name: 'NAME')
  final String name;
  @JsonKey(name: 'PRICE')
  final int price;
  @JsonKey(name: 'LIMITS')
  final List<Limits> limits;
  @JsonKey(name: 'EXCLUSIONS')
  final List<Exclusions> exclusions;
}
