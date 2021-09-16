import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../submit_button.dart';
import '../../../doctor_confirm_dialog.dart';
import '../../../../../components/app_bar_with_back_button.dart';
import '../../../../../components/friz_text.dart';
import '../../../../../components/helvetica_text.dart';
import '../../../../../../constants/spacers.dart';
import '../../../../../../constants/style_constants.dart';
import '../../../../../../helpers/validators/validate_date.dart';
import '../../../../../../helpers/validators/validate_symptoms.dart';
import '../../../../../../helpers/validators/validate_time.dart';
import '../../../../../../helpers/validators/validate_comment.dart';
import '../../../../../../helpers/validators/validate_doctor_name.dart';
import '../../../../../../helpers/show_message_snack_bar.dart';
import '../../../../../../helpers/validators/validate_medical_institution.dart';
import '../../../../../../../application/auth/auth_data_state_notifier_provider.dart';
import '../../../../../../../application/app/contact/current_contact_state_notifier_provider.dart';
import '../../../../../../../application/app/communication/come_to_doctor/come_to_doctor_form_key_provider.dart';
import '../../../../../../../application/app/communication/come_to_doctor/come_to_doctor_state_notifier.dart';
import '../../../../../../../application/app/communication/come_to_doctor/high_temperature_provider.dart';
import '../../../../../../../application/app/communication/come_to_doctor/medical_list_provider.dart';
import '../../../../../../../application/app/communication/come_to_doctor/sick_contact_provider.dart';
import '../../../../../../../application/app/insurances/insurance_id_state_notifier_provider.dart';
import '../../../../../../../application/controller/controller_key_provider.dart';
import '../../../../../../../domain/come_to_doctor/high_temperature_state.dart';
import '../../../../../../../domain/come_to_doctor/medical_list_state.dart';
import '../../../../../../../domain/come_to_doctor/sick_contact_state.dart';
import '../../../../../../../infrastructure/come_to_doctor/come_to_doctor_service.dart';
import '../../../../../../../widgets/time_picker.dart';

class ComeToDoctorPage extends HookWidget {
  final dateController = new TextEditingController();
  final timeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final comeToDoctorFormKey = useProvider(comeToDoctorFormKeyProvider);
    final comeToDoctor = useProvider(comeToDoctorStateNotifier);
    final comeToDoctorState = useProvider(comeToDoctorStateNotifier.state);
    final _comeToDoctorService = ComeToDoctorService();
    final authData = useProvider(authDataStateNotifierProvider).state;
    final controllerKey = useProvider(controllerKeyProvider);
    final userId = useProvider(currentContactStateNotifierProvider.state);
    final changeMedList = useProvider(medicalListStateProvider);
    final highTemperatureList = useProvider(highTemperatureStateProvider);
    final sickContactList = useProvider(sickContactStateProvider);
    final insuranceId = useProvider(insuranceIdStateNotifierProvider.state);

    void _processResponse(dynamic response) {
      print(response.status);
      if (response.status == 'success') {
        comeToDoctor.clearFields();
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return DoctorConfirmDialog();
            });
      } else {
        showMessageSnackBar(
          message: 'Error',
          scaffoldKey: controllerKey,
          color: errorColor,
        );
      }
    }

    return Scaffold(
      appBar: appBarWithBackButton(
        context: context,
        title: 'message_sign'.tr(),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: comeToDoctorFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HelveticaText(
                  text: 'add_to_insurance'.tr(),
                  size: 14,
                  color: subtitleColor,
                  align: TextAlign.center,
                ),
                SpaceH32(),
                FrizText(
                  text: 'bothering'.tr(),
                  size: 18,
                  color: textColor,
                ),
                SpaceH16(),
                TextFormField(
                  validator: validateSymptomsAlreadySigned,
                  onChanged: (String value) =>
                      comeToDoctor.updateSymptoms(value),
                  decoration: InputDecoration(
                    labelText: 'symptoms'.tr(),
                  ),
                ),
                SpaceH48(),
                FrizText(
                  text: 'desired_date'.tr(),
                  size: 18,
                  color: textColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      HelveticaText(
                        text: 'date'.tr(),
                        size: 16,
                        color: subtitleColor,
                      ),
                      Container(
                        width: 160,
                        height: 50,
                        child: TextFormField(
                          controller: dateController,
                          onTap: () {
                            DatePicker.showDatePicker(context, showTitleActions: true,
                                onChanged: (date)
                                {
                                  dateController.text =
                                  '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
                                  comeToDoctor.updateVisitDate(
                                      '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}'
                                  );
                                }, onConfirm: (date) {
                                  print('confirm $date');
                                  dateController.text =
                                  '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
                                  comeToDoctor.updateVisitDate(
                                      '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}'
                                  );
                                },
                                currentTime: DateTime.now(), locale: context.locale.languageCode == 'en' ? LocaleType.en : LocaleType.ru);
                          },
                          validator: validateDate,
                          onChanged: (String value) =>
                              comeToDoctor.updateVisitDate(value),
                          showCursor: true,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'dd_mm_yyyy'.tr(),
                            suffixIcon: Icon(
                              Icons.calendar_today,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SpaceH30(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HelveticaText(
                      text: 'visit_time'.tr(),
                      size: 16,
                      color: subtitleColor,
                    ),
                    Container(
                      width: 160,
                      height: 50,
                      child: TextFormField(
                        controller: timeController,
                        onTap: () {
                          DatePicker.showPicker(context, showTitleActions: true,
                              onChanged: (date)
                              {
                                timeController.text =
                                '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
                                comeToDoctor.updateVisitTime(
                                    '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}'
                                );
                              }, onConfirm: (date) {
                                print('confirm $date');
                                timeController.text =
                                '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
                                comeToDoctor.updateVisitTime(
                                    '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}'
                                );
                              },
                              pickerModel: TimePicker(currentTime: DateTime.now(), locale: LocaleType.ru),
                              locale: LocaleType.ru);
                        },
                        validator: validateTime,
                        onChanged: (String value) =>
                            comeToDoctor.updateVisitTime(value),
                        showCursor: true,
                        readOnly: true,
                        decoration: const InputDecoration(
                          hintText: '00:00',
                          suffixIcon: Icon(
                            Icons.access_time,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SpaceH45(),
                FrizText(
                  text: 'medical institution'.tr(),
                  size: 18,
                  color: textColor,
                ),
                SpaceH16(),
                TextFormField(
                  validator: validateMedicalInstitutionDoctorCoupon,
                  onChanged: (String value) =>
                      comeToDoctor.updateMedicalInstitution(value),
                  decoration: InputDecoration(
                    labelText: 'set_institution'.tr(),
                  ),
                ),
                SpaceH48(),
                FrizText(
                  text: 'doctor_name'.tr(),
                  size: 18,
                  color: textColor,
                ),
                SpaceH16(),
                TextFormField(
                  validator: validateDoctorName,
                  onChanged: (String value) =>
                      comeToDoctor.updateDoctorName(value),
                  decoration: InputDecoration(
                    labelText: 'set_doctor_name'.tr(),
                  ),
                ),
                SpaceH45(),
                FrizText(
                  text: 'need_sick'.tr(),
                  size: 18,
                  color: textColor,
                ),
                SpaceH8(),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: HelveticaText(
                            text: 'dont_need'.tr(),
                            size: 16,
                            color: textColor,
                          ),
                          leading: Radio(
                            value: MedicalListState.unnecessary,
                            groupValue: changeMedList.state,
                            onChanged: (MedicalListState value) {
                              changeMedList.state = MedicalListState.unnecessary;
                              comeToDoctor.updateMedicalList(false);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: HelveticaText(
                            text: 'need'.tr(),
                            size: 16,
                            color: textColor,
                          ),
                          leading: Radio(
                            value: MedicalListState.necessary,
                            groupValue: changeMedList.state,
                            onChanged: (MedicalListState value) {
                              changeMedList.state = MedicalListState.necessary;
                              comeToDoctor.updateMedicalList(true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SpaceH45(),
                FrizText(
                  text: 'high_temperature'.tr(),
                  size: 18,
                  color: textColor,
                ),
                SpaceH8(),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: HelveticaText(
                            text: 'no'.tr(),
                            size: 16,
                            color: textColor,
                          ),
                          leading: Radio(
                            value: HighTemperatureState.no,
                            groupValue: highTemperatureList.state,
                            onChanged: (HighTemperatureState value) {
                              highTemperatureList.state = HighTemperatureState.no;
                              comeToDoctor.updateHighTemperature(false);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: HelveticaText(
                            text: 'yes'.tr(),
                            size: 16,
                            color: textColor,
                          ),
                          leading: Radio(
                            value: HighTemperatureState.yes,
                            groupValue: highTemperatureList.state,
                            onChanged: (HighTemperatureState value) {
                              highTemperatureList.state = HighTemperatureState.yes;
                              comeToDoctor.updateHighTemperature(true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SpaceH45(),
                FrizText(
                  text: 'covid_contact'.tr(),
                  size: 18,
                  color: textColor,
                ),
                SpaceH8(),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: HelveticaText(
                            text: 'no'.tr(),
                            size: 16,
                            color: textColor,
                          ),
                          leading: Radio(
                            value: SickContactState.no,
                            groupValue: sickContactList.state,
                            onChanged: (SickContactState value) {
                              sickContactList.state =
                                  SickContactState.no;
                              comeToDoctor.updateSickContact(false);
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: HelveticaText(
                            text: 'yes'.tr(),
                            size: 16,
                            color: textColor,
                          ),
                          leading: Radio(
                            value: SickContactState.yes,
                            groupValue: sickContactList.state,
                            onChanged: (SickContactState value) {
                              sickContactList.state = SickContactState.yes;
                              comeToDoctor.updateSickContact(true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SpaceH45(),
                Text.rich(
                  TextSpan(
                      text: 'coment'.tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'FrizQuadrataCTT',
                        color: Color.fromRGBO(
                          40,
                          46,
                          58,
                          1,
                        ),
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'not_needed'.tr(),
                          style: const TextStyle(
                            color: Color.fromRGBO(
                              96,
                              110,
                              117,
                              1,
                            ),
                            fontFamily: 'HelveticaRegular',
                            fontSize: 12,
                          ),
                        ),
                      ]),
                ),
                SpaceH16(),
                TextFormField(
                  validator: validateComment,
                  onChanged: (String value) =>
                      comeToDoctor.updateComment(value),
                  decoration: InputDecoration(
                    labelText: 'add_more_info'.tr(),
                  ),
                ),
                SpaceH80(),
                SubmitButton(
                  title: 'signing_up_to_doctor'.tr(),
                  onTap: () async {
                    if (comeToDoctorFormKey.currentState.validate()) {
                      final response = await _comeToDoctorService.sendQuery(
                        comeToDoctorState,
                        authData.data.token,
                        userId,
                        insuranceId,
                      );

                      _processResponse(response);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
