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
      medicalList: false,
      comment: state.comment,
    );
  }

  void updateVisitDate(String visitDate) {
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: state.visitTimeFrom,
      medicalInstitution: state.medicalInstitution,
      medicalList: false,
      comment: state.comment,
    );
  }

  void updateVisitTimeFrom(String visitTimeFrom) {
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: visitTimeFrom,
      visitTimeTo: state.visitTimeFrom,
      medicalInstitution: state.medicalInstitution,
      medicalList: false,
      comment: state.comment,
    );
  }

  void updateVisitTimeTo(String visitTimeTo) {
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: visitTimeTo,
      medicalInstitution: state.medicalInstitution,
      medicalList: false,
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
      medicalList: false,
      comment: state.comment,
    );
  }

  void updateMedicalList(bool medicalList) {
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: state.visitTimeTo,
      medicalInstitution: state.medicalInstitution,
      medicalList: medicalList,
      comment: state.comment,
    );
  }

  void updateComment(String comment) {
    state = DoctorCouponRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTimeFrom: state.visitTimeFrom,
      visitTimeTo: state.visitTimeTo,
      medicalInstitution: state.medicalInstitution,
      medicalList: false,
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
        comment: '',
    );
  }
}
