import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/doctor_coupon/doctor_coupon_request.dart';

final doctorCouponStateNotifier =
    StateNotifierProvider.autoDispose<DoctorStateNotifier>(
  (ref) => DoctorStateNotifier(),
);

class DoctorStateNotifier extends StateNotifier<DoctorCouponRequest> {
  DoctorStateNotifier()
      : super(
          DoctorCouponRequest(
            symptoms: '',
            visitDate: '',
            visitTimeFrom: '',
            visitTimeTo: '',
            medicalInstitution: '',
            medicalList: false,
            sickContact: false,
            highTemperature: false,
            comment: '',
          ),
        );

  void updateSymptoms(String symptoms) {
    state = DoctorCouponRequest(
      symptoms: symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: state.visitTimeFrom,
      medicalInstitution: state.medicalInstitution,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateVisitDate(String visitDate) {
    print('visitDate: ${visitDate}');
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: state.visitTimeFrom,
      medicalInstitution: state.medicalInstitution,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateVisitTimeFrom(String visitTimeFrom) {
    print('visitTimeFrom: ${visitTimeFrom}');
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: visitTimeFrom,
      visitTimeTo: state.visitTimeFrom,
      medicalInstitution: state.medicalInstitution,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateVisitTimeTo(String visitTimeTo) {
    print('visitTimeTo: ${visitTimeTo}');
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: visitTimeTo,
      medicalInstitution: state.medicalInstitution,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateMedicalInstitution(String medicalInstitution) {
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: state.visitTimeTo,
      medicalInstitution: medicalInstitution,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateMedicalList(bool medicalList) {
    print('medicalList: ${medicalList}');
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: state.visitTimeTo,
      medicalInstitution: state.medicalInstitution,
      medicalList: medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateSickContact(bool sickContact) {
    print('sickContact: ${sickContact}');
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: state.visitTimeTo,
      medicalInstitution: state.medicalInstitution,
      medicalList: state.medicalList,
      sickContact: sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateHighTemperature(bool highTemperature) {
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: state.visitTimeTo,
      medicalInstitution: state.medicalInstitution,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: highTemperature,
      comment: state.comment,
    );
  }

  void updateComment(String comment) {
    print('comment: ${comment}');
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: state.visitTimeTo,
      medicalInstitution: state.medicalInstitution,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: comment,
    );
  }

  void clearFields() {
    state = DoctorCouponRequest(
        symptoms: '',
        visitDate: '',
        visitTimeFrom: '',
        visitTimeTo: '',
        medicalInstitution: '',
        medicalList: false,
        sickContact: false,
        highTemperature: false,
        comment: '',
    );

    print('DoctorCouponRequest: ${state.symptoms}');
  }
}
