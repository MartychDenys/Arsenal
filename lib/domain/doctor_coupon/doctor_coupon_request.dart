import 'package:flutter/foundation.dart';

class DoctorCouponRequest {
  DoctorCouponRequest({
    @required this.symptoms,
    @required this.visitDate,
    @required this.visitTimeFrom,
    @required this.visitTimeTo,
    this.medicalInstitution,
    this.medicalList,
    this.sickContact,
    this.highTemperature,
    this.comment,
  });

  final String symptoms;
  final String visitDate;
  final String visitTimeFrom;
  final String visitTimeTo;
  final String medicalInstitution;
  final bool medicalList;
  final bool sickContact;
  final bool highTemperature;
  final String comment;
}
