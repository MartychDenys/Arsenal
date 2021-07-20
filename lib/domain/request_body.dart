import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class RequestBody extends Equatable {
  RequestBody({
    @required this.token,
    @required this.id,
    this.insuranceId,
  });

  final String token;
  final String id;
  final String insuranceId;

  @override
  List<Object> get props => [token, id, insuranceId];
}
