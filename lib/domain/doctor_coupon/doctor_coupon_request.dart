import 'package:flutter/foundation.dart';

class DoctorCouponRequest {
  DoctorCouponRequest({
    @required this.symptoms,
    @required this.visitDate,
    @required this.visitTimeFrom,
    @required this.visitTimeTo,
    this.medicalInstitution,
    this.medicalList,
    this.comment,
  });

  final String symptoms;
  final String visitDate;
  final String visitTimeFrom;
  final String visitTimeTo;
  final String medicalInstitution;
  final bool medicalList;
  final String comment;
}
