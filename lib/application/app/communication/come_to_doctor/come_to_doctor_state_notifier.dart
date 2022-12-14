import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../domain/come_to_doctor/come_to_doctor_request.dart';

final comeToDoctorStateNotifier =
    StateNotifierProvider.autoDispose<ComeToDoctorStateNotifier>(
  (ref) => ComeToDoctorStateNotifier(),
);

class ComeToDoctorStateNotifier extends StateNotifier<ComeToDoctorRequest> {
  ComeToDoctorStateNotifier()
      : super(
          ComeToDoctorRequest(
            symptoms: '',
            visitDate: '',
            visitTime: '',
            medicalInstitution: '',
            doctorName: '',
            medicalList: false,
            sickContact: false,
            highTemperature: false,
            comment: '',
          ),
        );

  void updateSymptoms(String symptoms) {
    state = ComeToDoctorRequest(
      symptoms: symptoms,
      visitDate: state.visitDate,
      visitTime: state.visitTime,
      medicalInstitution: state.medicalInstitution,
      doctorName: state.doctorName,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateVisitDate(String visitDate) {
    state = ComeToDoctorRequest(
      symptoms: state.symptoms,
      visitDate: visitDate,
      visitTime: state.visitTime,
      medicalInstitution: state.medicalInstitution,
      doctorName: state.doctorName,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateVisitTime(String visitTime) {
    state = ComeToDoctorRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTime: visitTime,
      medicalInstitution: state.medicalInstitution,
      doctorName: state.doctorName,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateMedicalInstitution(String medicalInstitution) {
    state = ComeToDoctorRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTime: state.visitTime,
      medicalInstitution: medicalInstitution,
      doctorName: state.doctorName,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateDoctorName(String doctorName) {
    state = ComeToDoctorRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTime: state.visitTime,
      medicalInstitution: state.medicalInstitution,
      doctorName: doctorName,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateMedicalList(bool medicalList) {
    state = ComeToDoctorRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTime: state.visitTime,
      medicalInstitution: state.medicalInstitution,
      doctorName: state.doctorName,
      medicalList: medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateSickContact(bool sickContact) {
    state = ComeToDoctorRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTime: state.visitTime,
      medicalInstitution: state.medicalInstitution,
      doctorName: state.doctorName,
      medicalList: state.medicalList,
      sickContact: sickContact,
      highTemperature: state.highTemperature,
      comment: state.comment,
    );
  }

  void updateHighTemperature(bool highTemperature) {
    state = ComeToDoctorRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTime: state.visitTime,
      medicalInstitution: state.medicalInstitution,
      doctorName: state.doctorName,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: highTemperature,
      comment: state.comment,
    );
  }

  void updateComment(String comment) {
    state = ComeToDoctorRequest(
      symptoms: state.symptoms,
      visitDate: state.visitDate,
      visitTime: state.visitTime,
      medicalInstitution: state.medicalInstitution,
      doctorName: state.doctorName,
      medicalList: state.medicalList,
      sickContact: state.sickContact,
      highTemperature: state.highTemperature,
      comment: comment,
    );
  }

  void clearFields() {
    state = ComeToDoctorRequest(
      symptoms: '',
      visitDate: '',
      visitTime: '',
      medicalInstitution: '',
      doctorName: '',
      medicalList: false,
      sickContact: false,
      highTemperature: false,
      comment: '',
    );
  }
}
