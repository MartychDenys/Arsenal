import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../submit_button.dart';
import '../../../doctor_dialog.dart';
import '../../../../../components/app_bar_with_back_button.dart';
import '../../../../../components/friz_text.dart';
import '../../../../../components/helvetica_text.dart';
import '../../../../../../constants/spacers.dart';
import '../../../../../../constants/style_constants.dart';
import '../../../../../../helpers/show_message_snack_bar.dart';
import '../../../../../../helpers/validators/validate_symptoms.dart';
import '../../../../../../helpers/validators/validate_date.dart';
import '../../../../../../helpers/validators/validate_time.dart';
import '../../../../../../helpers/validators/validate_comment.dart';
import '../../../../../../helpers/validators/validate_medical_institution.dart';
import '../../../../../../../application/controller/controller_key_provider.dart';
import '../../../../../../../application/auth/auth_data_state_notifier_provider.dart';
import '../../../../../../../application/app/communication/doctor_coupon/doctor_coupon_form_key_provider.dart';
import '../../../../../../../application/app/communication/doctor_coupon/doctor_coupon_state_notifier.dart';
import '../../../../../../../application/app/communication/doctor_coupon/high_temperature_provider.dart';
import '../../../../../../../application/app/communication/doctor_coupon/medical_list_provider.dart';
import '../../../../../../../application/app/communication/doctor_coupon/sick_contact_provider.dart';
import '../../../../../../../application/app/contact/current_contact_state_notifier_provider.dart';
import '../../../../../../../application/app/contact/contact_state_notifier.dart';
import '../../../../../../../application/app/insurances/insurance_id_state_notifier_provider.dart';
import '../../../../../../../domain/doctor_coupon/high_temperature_state.dart';
import '../../../../../../../domain/doctor_coupon/medical_list_state.dart';
import '../../../../../../../domain/doctor_coupon/sick_contact_state.dart';
import '../../../../../../../infrastructure/doctor_coupon/doctor_coupon_service.dart';
import '../../../../../../../widgets/time_picker.dart';

class DoctorCouponPage extends HookWidget {
  final dateController = new TextEditingController();
  final timeFromController = new TextEditingController();
  final timeToController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final doctorCouponFormKey = useProvider(doctorCouponFormKeyProvider);
    final doctorCoupon = useProvider(doctorCouponStateNotifier);
    final doctorCouponState = useProvider(doctorCouponStateNotifier.state);
    final _doctorCouponService = DoctorCouponService();
    final authData = useProvider(authDataStateNotifierProvider).state;
    final controllerKey = useProvider(controllerKeyProvider);
    final contact = useProvider(contactStateNotifier).state;
    final userId = useProvider(currentContactStateNotifierProvider.state);
    final changeMedList = useProvider(medicalListStateProvider);
    final highTemperatureList = useProvider(highTemperatureStateProvider);
    final sickContactList = useProvider(sickContactStateProvider);
    final insuranceId = useProvider(insuranceIdStateNotifierProvider.state);

    void _processResponse(dynamic response) {
      print(response.status);
      if (response.status == 'success') {
        doctorCoupon.clearFields();
        showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return DoctorDialog();
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
        title: 'sign_up'.tr(),
        context: context,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: doctorCouponFormKey,
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HelveticaText(
                  text: 'fill_all'.tr(),
                  size: 14,
                  color: subtitleColor,
                  align: TextAlign.center,
                ),
                SpaceH32(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FrizText(
                      text: 'bothering'.tr(),
                      size: 18,
                      color: textColor,
                    ),
                    SpaceH16(),
                    TextFormField(
                      validator: validateSymptomsDoctorCoupon,
                      onChanged: (String value) =>
                          doctorCoupon.updateSymptoms(value),
                      decoration: InputDecoration(
                        labelText: 'symptoms'.tr(),
                      ),
                    ),
                  ],
                ),
                SpaceH48(),
                FrizText(
                  text: 'desired_date_full'.tr(),
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
                              doctorCoupon.updateVisitDate(
                                  '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}'
                              );
                            }, onConfirm: (date) {
                              dateController.text =
                              '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
                              doctorCoupon.updateVisitDate(
                                '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}'
                              );
                              },
                                currentTime: DateTime.now(), locale: LocaleType.ru);
                          },
                          validator: validateDate,
                          showCursor: true,
                          readOnly: true,
                          decoration: const InputDecoration(
                            hintText: 'дд.мм.гггг',
                            suffixIcon: Icon(
                              Icons.calendar_today,
                              color: Color.fromRGBO(18, 151, 71, 1),
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
                      text: 'time'.tr(),
                      size: 16,
                      color: subtitleColor,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 30,
                          width: 70,
                          child: TextFormField(
                            controller: timeFromController,
                            onTap: () {
                              DatePicker.showPicker(context, showTitleActions: true,
                                  onChanged: (date)
                                  {
                                    timeFromController.text =
                                    '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
                                    doctorCoupon.updateVisitTimeFrom(
                                        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}'
                                    );
                                  }, onConfirm: (date) {
                                    print('confirm $date');
                                    timeFromController.text =
                                    '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
                                    doctorCoupon.updateVisitTimeFrom(
                                        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}'
                                    );
                                  },
                                  pickerModel: TimePicker(currentTime: DateTime.now(), locale: LocaleType.ru),
                                  locale: LocaleType.ru);
                            },
                            validator: validateTime,
                            showCursor: true,
                            readOnly: true,
                            onChanged: (String value) =>
                                doctorCoupon.updateVisitTimeFrom(value),
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: '13:30',
                            ),
                          ),
                        ),
                        const HelveticaText(
                          text: ' - ',
                          size: 17,
                          color: subtitleColor,
                        ),
                        Container(
                          height: 30,
                          width: 70,
                          child: TextFormField(
                            controller: timeToController,
                            onTap: () {
                              DatePicker.showPicker(context, showTitleActions: true,
                                  onChanged: (date)
                                  {
                                    timeToController.text =
                                    '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
                                    doctorCoupon.updateVisitTimeTo(
                                        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}'
                                    );
                                  }, onConfirm: (date) {
                                    timeToController.text =
                                    '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
                                    doctorCoupon.updateVisitTimeTo(
                                        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}'
                                    );
                                  },
                                  pickerModel: TimePicker(currentTime: DateTime.now(), locale: LocaleType.ru),
                                  locale: LocaleType.ru);
                            },
                            validator: validateTime,
                            showCursor: true,
                            readOnly: true,
                            onChanged: (String value) =>
                                doctorCoupon.updateVisitTimeTo(value),
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              hintText: '15:30',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SpaceH45(),
                Text.rich(
                  TextSpan(
                      text: 'institution'.tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'FrizQuadrataCTT',
                        color: Color.fromRGBO(40, 46, 58, 1),
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'not_needed'.tr(),
                          style: const TextStyle(
                            color: Color.fromRGBO(96, 110, 117, 1),
                            fontFamily: 'HelveticaRegular',
                            fontSize: 12,
                          ),
                        ),
                      ]),
                ),
                SpaceH16(),
                TextFormField(
                  validator: validateMedicalInstitutionDoctorCoupon,
                  onChanged: (String value) =>
                      doctorCoupon.updateMedicalInstitution(value),
                  decoration: InputDecoration(
                    labelText: 'set_institution'.tr(),
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
                              doctorCoupon.updateMedicalList(false);
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
                              doctorCoupon.updateMedicalList(true);
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
                              doctorCoupon.updateHighTemperature(false);
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
                              doctorCoupon.updateHighTemperature(true);
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
                              doctorCoupon.updateSickContact(false);
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
                              doctorCoupon.updateSickContact(true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SpaceH40(),
                Text.rich(
                  TextSpan(
                      text: 'comment'.tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'FrizQuadrataCTT',
                        color: Color.fromRGBO(40, 46, 58, 1),
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: 'not_needed'.tr(),
                          style: const TextStyle(
                            color: Color.fromRGBO(96, 110, 117, 1),
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
                      doctorCoupon.updateComment(value),
                  decoration: InputDecoration(
                    labelText: 'add_more_info'.tr(),
                  ),
                ),
                SpaceH80(),
                SubmitButton(
                  title: 'signing_up_to_doctor'.tr(),
                  onTap: () async {
                    if (doctorCouponFormKey.currentState.validate()) {
                      final response = await _doctorCouponService.sendQuery(
                        doctorCouponState,
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
