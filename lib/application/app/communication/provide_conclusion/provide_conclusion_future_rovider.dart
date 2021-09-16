import '../../../../presentation/app/components/popups/additional_popup.dart';
import 'package:flutter/material.dart';
import '../../../../presentation/app/components/popups/popup_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'provide_conclusion_state_notifier.dart';
import '../../../../infrastructure/provide_conclusion/provide_conclusion.service.dart';
import '../../contact/current_contact_state_notifier_provider.dart';
import '../../insurances/insurance_id_state_notifier_provider.dart';
import '../../../auth/auth_data_state_notifier_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final provideConclusionFutureProvider = FutureProvider.autoDispose.family<void, BuildContext>((ref, context) async {
  final provideConclusionStateProvider = ref.read(provideConclusionStateNotifier.state);
  final authData = ref.read(authDataStateNotifierProvider.state);
  final userId = ref.read(currentContactStateNotifierProvider.state);
  final insuranceId = ref.read(insuranceIdStateNotifierProvider.state);

  final response = await ProvideConclusionService().sendQuery(
    provideConclusionStateProvider,
    authData.data.token,
    userId,
    insuranceId,
  );

  ref.read(provideConclusionStateNotifier).clearFields();

  if (response == 'success') {
    showCustomDialog(
      context: context,
      child: ShowSystemErrorPopup(message: 'conclusion_was_upload_success'.tr(), closePopup: () {Navigator.pop(context);},),
    );
  } else {
    showCustomDialog(
      context: context,
      child: ShowSystemErrorPopup(message: 'conclusion_was_upload_error'.tr(), closePopup: () {Navigator.pop(context);},),
    );
  }
});