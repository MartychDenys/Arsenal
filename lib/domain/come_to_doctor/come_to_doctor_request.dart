import 'package:flutter/foundation.dart';

class ComeToDoctorRequest {
  ComeToDoctorRequest({
    @required this.symptoms,
    @required this.visitDate,
    @required this.visitTime,
    @required this.medicalInstitution,
    @required this.doctorName,
    this.medicalList,
    this.sickContact,
    this.highTemperature,
    this.comment,
  });

  final String symptoms;
  final String visitDate;
  final String visitTime;
  final String medicalInstitution;
  final String doctorName;
  final bool medicalList;
  final bool sickContact;
  final bool highTemperature;
  final String comment;
}
