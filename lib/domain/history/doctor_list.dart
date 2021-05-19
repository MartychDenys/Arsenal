import 'package:json_annotation/json_annotation.dart';
import 'doctor_item.dart';
part 'doctor_list.g.dart';

@JsonSerializable()
class DoctorList {
  DoctorList({
    this.status,
    this.data,
  });

  factory DoctorList.fromJson(Map<String, dynamic> json) =>
      _$DoctorListFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorListToJson(this);

  final String status;
  final List<DoctorItem> data;
}
