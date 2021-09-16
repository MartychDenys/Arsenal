import 'history_page_components/doctor_history_tile.dart';
import 'history_page_components/history_page_main_text.dart';
import 'history_page_components/history_tile.dart';

import '../../../../../../domain/history/conclusion_list.dart';
import 'history_page_components/conclusion_tile.dart';

import '../../../../../../application/app/communication/history/conclusion_history_future_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../components/app_bar_with_back_button.dart';
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
    // final conclusionHistoryData = useProvider(conclusionHistoryFutureProvider(
    //     RequestBody(token: authData, id: userId, insuranceId: insuranceId)));

    return Scaffold(
      appBar: appBarWithBackButton(
        context: context,
        title: 'history_title'.tr(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HistoryPageMainText(),

            historyData.when(
              data: (data) {
                if (data is ConfirmedList) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: <Widget>[
                      for (final item in data.data)
                        HistoryTile(historyTile: item),
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
              data: (doctorHistory) {
                if (doctorHistory is DoctorList) {
                  return ListView(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    children: <Widget>[
                      for (final item in doctorHistory.data)
                        DoctorHistoryTile(doctorTile: item)
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
            // conclusionHistoryData.when(
            //   data: (conclusions) {
            //     if (conclusions is ConclusionList) {
            //       return ListView(
            //         shrinkWrap: true,
            //         physics: const ScrollPhysics(),
            //         children: <Widget>[
            //           for (final conclusion in conclusions.data)
            //             ConclusionTile(conclusion: conclusion),
            //         ],
            //       );
            //     } else {
            //       return Text('Unknown error');
            //     }
            //   },
            //   loading: () => Loader(),
            //   error: (object, stackTrace) {
            //     return Center(
            //       child: Text('$object'),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
