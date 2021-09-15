import 'conclusion_item.dart';
import 'package:json_annotation/json_annotation.dart';
part 'conclusion_list.g.dart';

@JsonSerializable()
class ConclusionList {
  ConclusionList({
    this.status,
    this.data,
  });

  factory ConclusionList.fromJson(Map<String, dynamic> json) =>
      _$ConclusionListFromJson(json);

  Map<String, dynamic> toJson() => _$ConclusionListToJson(this);

  final String status;
  final List<ConclusionItem> data;
}