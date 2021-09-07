import 'package:easy_localization/easy_localization.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../components/app_bar_with_back_button.dart';
import '../../../../components/friz_text.dart';
import '../../../../components/helvetica_text.dart';
import '../../../../../constants/spacers.dart';
import '../../../../../constants/style_constants.dart';
import '../../../../../loader.dart';
import '../../../../../../application/app/insurances/insurance_id_state_notifier_provider.dart';
import '../../../../../../application/app/communication/history/doctor_history_future_provider.dart';
import '../../../../../../application/app/communication/history/history_future_provider.dart';
import '../../../../../../application/app/contact/current_contact_state_notifier_provider.dart';
import '../../../../../../application/auth/auth_data_state_notifier_provider.dart';
import '../../../../../../domain/history/confirmed_list.dart';
import '../../../../../../domain/history/doctor_list.dart';
import '../../../../../../domain/request_body.dart';

class HistoryPage extends HookWidget {
  static const routeName = '/history';

  @override
  Widget build(BuildContext context) {
    final authData =
        useProvider(authDataStateNotifierProvider.state).data.token;
    final userId = useProvider(currentContactStateNotifierProvider.state);
    final insuranceId = useProvider(insuranceIdStateNotifierProvider.state);
    final historyData = useProvider(historyFutureProvider(
        RequestBody(token: authData, id: userId, insuranceId: insuranceId)));
    final doctorHistoryData = useProvider(doctorHistoryFutureProvider(
        RequestBody(token: authData, id: userId, insuranceId: insuranceId)));

    return Scaffold(
      appBar: appBarWithBackButton(
        context: context,
        title: 'history_title'.tr(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 17,
                left: 40,
                right: 40,
                bottom: 30,
              ),
              alignment: Alignment.topCenter,
              child: HelveticaText(
                text: 'here_history'.tr(),
                size: 13,
                color: subtitleColor,
                align: TextAlign.center,
              ),
            ),
            historyData.when(
              data: (data) {
                if (data is ConfirmedList) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: [
                      for (final item in data.data) ...[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: ExpandablePanel(
                            header: FrizText(
                              text: 'sign_up_to_doctor'.tr(),
                              size: 18,
                            ),
                            collapsed: HelveticaText(
                              text: item.visitDate,
                              size: 14,
                              color: subtitleColor,
                            ),
                            expanded: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'date'.tr() + ': ',
                                        size: 14,
                                      ),
                                      HelveticaText(
                                        text: item.visitDate,
                                        size: 14,
                                        color: textColor,
                                      ),
                                    ],
                                  ),
                                  SpaceH16(),
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'complaints'.tr() + ': ',
                                        size: 14,
                                      ),
                                      HelveticaText(
                                        text: item.symptoms,
                                        size: 14,
                                        color: textColor,
                                      ),
                                    ],
                                  ),
                                  SpaceH16(),
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'visit_time'.tr() + ' ',
                                        size: 14,
                                      ),
                                      HelveticaText(
                                        text: item.visitTime,
                                        size: 14,
                                        color: textColor,
                                      ),
                                    ],
                                  ),
                                  SpaceH16(),
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'date'.tr() + ': ',
                                        size: 14,
                                      ),
                                      HelveticaText(
                                        text: item.visitDate,
                                        size: 14,
                                        color: textColor,
                                      ),
                                    ],
                                  ),
                                  SpaceH16(),
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'medical institution'.tr() + ': ',
                                        size: 14,
                                      ),
                                      HelveticaText(
                                        text: item.medInstitution,
                                        size: 14,
                                        color: textColor,
                                      ),
                                    ],
                                  ),
                                  SpaceH16(),
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'coment'.tr() + ': ',
                                        size: 14,
                                      ),
                                      HelveticaText(
                                        text: item.comment,
                                        size: 14,
                                        color: textColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(
                                16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  );
                } else {
                  return Text('Unknown error');
                }
              },
              loading: () => Loader(),
              error: (object, stackTrace) {
                return Center(
                  child: Text('$object'),
                );
              },
            ),
            doctorHistoryData.when(
              data: (data) {
                if (data is DoctorList) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: [
                      for (final item in data.data) ...[
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: ExpandablePanel(
                            header: FrizText(
                              text: 'sign_up_to_doctor'.tr(),
                              size: 18,
                            ),
                            collapsed: HelveticaText(
                              text: item.visitDate,
                              size: 14,
                              color: subtitleColor,
                            ),
                            expanded: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'date'.tr() + ': ',
                                        size: 14,
                                      ),
                                      HelveticaText(
                                        text: item.visitDate,
                                        size: 14,
                                        color: textColor,
                                      ),
                                    ],
                                  ),
                                  SpaceH16(),
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'complaints'.tr() + ': ',
                                        size: 14,
                                      ),
                                      HelveticaText(
                                        text: item.symptoms,
                                        size: 14,
                                        color: textColor,
                                      ),
                                    ],
                                  ),
                                  SpaceH16(),
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'visit_time'.tr() + ' ',
                                        size: 14,
                                      ),
                                      HelveticaText(
                                        text: item.visitDate,
                                        size: 14,
                                        color: textColor,
                                      ),
                                    ],
                                  ),
                                  SpaceH16(),
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'date'.tr() + ': ',
                                        size: 14,
                                      ),
                                      HelveticaText(
                                        text: item.visitDate,
                                        size: 14,
                                        color: textColor,
                                      ),
                                    ],
                                  ),
                                  SpaceH16(),
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'medical institution'.tr() + ': ',
                                        size: 14,
                                      ),
                                      Expanded(
                                        child: HelveticaText(
                                          text: item.medInstitution,
                                          size: 14,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SpaceH16(),
                                  Row(
                                    children: [
                                      FrizText(
                                        text: 'coment'.tr() + ': ',
                                        size: 14,
                                      ),
                                      HelveticaText(
                                        text: item.comment,
                                        size: 14,
                                        color: textColor,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(
                                16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  );
                } else {
                  return Text('Unknown error');
                }
              },
              loading: () => Loader(),
              error: (object, stackTrace) {
                return Center(
                  child: Text('$object'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
