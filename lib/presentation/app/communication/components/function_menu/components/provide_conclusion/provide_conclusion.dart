import '../../../../../../../locale/app_localizations.dart';

import '../../../../../../../application/app/contact/current_contact_state_notifier_provider.dart';
import '../../../../../../../application/app/insurances/insurance_id_state_notifier_provider.dart';
import '../../../../../../../application/auth/auth_data_state_notifier_provider.dart';
import '../../../../../../../infrastructure/provide_conclusion/provide_conclusion.service.dart';
import '../../../../../components/popups/additional_popup.dart';
import '../../../../../components/popups/popup_auth.dart';

import '../../../../../../../application/app/communication/provide_conclusion/provide_conclusion_photo_error_state.dart';
import '../../../../../../../application/app/communication/provide_conclusion/provide_conclusion_state_notifier.dart';
import '../../../../../../../infrastructure/provide_conclusion/provide_conclusion_image.service.dart';
import '../submit_button.dart';
import '../../../../../components/helvetica_text.dart';
import '../../../../../../constants/spacers.dart';
import '../../../../../../helpers/validators/validate_comment.dart';
import '../../../../../../helpers/validators/validate_date.dart';
import '../../../../../../../widgets/function_menu_item.dart';
import 'dart:io';

import '../../../../../../../application/app/communication/provide_conclusion/provide_conclusion_form_key_provider.dart';
import '../../../../../../constants/style_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../../../components/app_bar_with_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:easy_localization/easy_localization.dart';

class ProvideConclusion extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final provideConclusionFormKey =
        useProvider(provideConclusionFormKeyProvider);
    final provideConclusionState = useProvider(provideConclusionStateNotifier);

    final provideConclusionStateProvider = useProvider(provideConclusionStateNotifier.state);
    final authData = useProvider(authDataStateNotifierProvider.state);
    final userId = useProvider(currentContactStateNotifierProvider.state);
    final insuranceId = useProvider(insuranceIdStateNotifierProvider.state);


    final provideConclusionPhotoError =
        useProvider(provideConclusionPhotoErrorProvide);
    final dateController = new TextEditingController();

    _saveImage(File image) {
      provideConclusionState.updateImage(image);
    }

    dateController.text = provideConclusionState.visitDate != null
        ? provideConclusionState.visitDate
        : '';

    return Scaffold(
      appBar: appBarWithBackButton(
        context: context,
        title: 'provide'.tr(),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: provideConclusionFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    'date_conclusion'.tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'FrizQuadrataCTT',
                      color: Color.fromRGBO(40, 46, 58, 1),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    HelveticaText(
                      text: 'date_conclusion_visit'.tr(),
                      size: 16,
                      color: subtitleColor,
                    ),
                    SpaceW10(),
                    Expanded(
                      child: Container(
                        width: 160,
                        height: 50,
                        child: TextFormField(
                          controller: dateController,
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true, onChanged: (date) {
                              dateController.text =
                                  '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
                              provideConclusionState.updateVisitDate(
                                  '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}');
                            }, onConfirm: (date) {
                              dateController.text =
                                  '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
                              provideConclusionState.updateVisitDate(
                                  '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}');
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.ru);
                          },
                          validator: validateDate,
                          showCursor: true,
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: 'dd_mm_yyyy'.tr(),
                            suffixIcon: Icon(
                              Icons.calendar_today,
                              color: Color.fromRGBO(18, 151, 71, 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Text(
                    'make_photo'.tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'FrizQuadrataCTT',
                      color: Color.fromRGBO(40, 46, 58, 1),
                    ),
                  ),
                ),
                FunctionMenuItem(
                  title: 'upload_photo_title'.tr(),
                  buttonFunc: () async {
                    final image =
                        await ProvideConclusionImageService().getImageGallery();
                    if (image != null) {
                      provideConclusionPhotoError.state = false;
                      _saveImage(image);
                    }
                  },
                  buttonTitle: (provideConclusionState.image != null)
                      ? 'uploaded'.tr()
                      : 'upload'.tr(),
                ),
                if (provideConclusionPhotoError.state)
                  Text(
                    '?????????????????? ?????? ???????????????? ????????',
                    style: TextStyle(color: Colors.red, fontSize: 12.0),
                  ),
                FunctionMenuItem(
                  title: 'make_photo_title'.tr(),
                  buttonFunc: () async {
                    final image =
                        await ProvideConclusionImageService().getImageCamera();
                    if (image != null) {
                      provideConclusionPhotoError.state = false;
                      _saveImage(image);
                    }
                  },
                  buttonTitle: (provideConclusionState.image != null)
                      ? 'uploaded'.tr()
                      : 'make_upload_photo'.tr(),
                ),
                if (provideConclusionPhotoError.state)
                  Text(
                    '?????????????????? ?????? ???????????????? ????????',
                    style: TextStyle(color: Colors.red, fontSize: 12.0),
                  ),
                SpaceH10(),
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
                    ],
                  ),
                ),
                SpaceH8(),
                TextFormField(
                  validator: validateComment,
                  onChanged: (String value) =>
                      provideConclusionState.updateComment(value),
                  decoration: InputDecoration(
                    labelText: 'add_more_info'.tr(),
                  ),
                ),
                SpaceH80(),
                SubmitButton(
                  title:
                      "${'upload'.tr()[0].toUpperCase()}${'upload'.tr().substring(1)}",
                  onTap: () async {
                    if (provideConclusionFormKey.currentState.validate()) {
                      if (provideConclusionState.image != null) {
                        // await context.read(provideConclusionFutureProvider(context));

                        final response = await ProvideConclusionService().sendQuery2(
                          provideConclusionStateProvider,
                          authData.data.token,
                          userId,
                          insuranceId,
                        );

                        if (response == 'success') {
                          showCustomDialog(
                            context: context,
                            child: ShowSystemErrorPopup(message: 'conclusion_was_upload_success'.tr(), closePopup: () {Navigator.pop(context);},),
                          );
                        } else {
                          showCustomDialog(
                            context: context,
                            child: ShowSystemErrorPopup(message: 'conclusion_was_upload_error'.tr(), closePopup: () {Navigator.pop(context);}),
                          );
                        }
                      } else {
                        provideConclusionPhotoError.state = true;
                      }
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
