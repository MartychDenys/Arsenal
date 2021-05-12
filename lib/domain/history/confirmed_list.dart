import 'package:json_annotation/json_annotation.dart';
import 'confirmed_item.dart';

part 'confirmed_list.g.dart';

@JsonSerializable()
class ConfirmedList {
  ConfirmedList({
    this.status,
    this.data,
  });

  factory ConfirmedList.fromJson(Map<String, dynamic> json) =>
      _$ConfirmedListFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmedListToJson(this);

  final String status;
  final List<ConfirmedItem> data;
}
