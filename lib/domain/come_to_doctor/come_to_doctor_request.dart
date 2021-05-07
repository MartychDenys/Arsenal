import 'package:flutter/foundation.dart';

class ComeToDoctorRequest {
  ComeToDoctorRequest({
    @required this.symptoms,
    @required this.visitDate,
    @required this.visitTime,
    @required this.medicalInstitution,
    @required this.doctorName,
    this.comment,
  });

  final String symptoms;
  final String visitDate;
  final String visitTime;
  final String medicalInstitution;
  final String doctorName;
  final String comment;
}
