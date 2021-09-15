import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conclusion_item.g.dart';

@JsonSerializable()
class ConclusionItem {
  ConclusionItem({
    @required this.date,
    @required this.comment,
    @required this.photo,

  });

  factory ConclusionItem.fromJson(Map<String, dynamic> json) =>
      _$ConclusionItemFromJson(json);

  Map<String, dynamic> toJson() => _$ConclusionItemToJson(this);

  @JsonKey(name: 'DATE')
  final String date;
  @JsonKey(name: 'COMMENT')
  final String comment;
  @JsonKey(name: 'PHOTO')
  final dynamic photo;
}
