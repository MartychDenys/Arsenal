import 'package:arsenal_app/domain/history/hitory_state.dart';
import 'package:arsenal_app/presentation/app/components/friz_text.dart';
import 'package:arsenal_app/presentation/constants/spacers.dart';

import '../../../../../../application/auth/auth_data_state_notifier_provider.dart';
import '../../../../../../application/app/communication/history/history_future_provider.dart';
import '../../../../../../domain/history/confirmed_list.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../constants/style_constants.dart';
import '../../../../../loader.dart';
import '../../../../components/app_bar_with_back_button.dart';
import '../../../../components/helvetica_text.dart';
import '../../../../../../domain/history/confirmed_item.dart';
import '../../../../../../application/app/communication/history/hitory_state_provider.dart';

class HistoryPage extends HookWidget {
  static const routeName = '/history';

  @override
  Widget build(BuildContext context) {
    //final contact = useProvider(contactFutureProvider(authData.data.token));
    final authData = useProvider(authDataStateNotifierProvider).state;
    final historyData = useProvider(historyFutureProvider(authData.data.token));
    final showHistory = useProvider(showHistoryStateProvider);

    return Scaffold(
      appBar: appBarWithBackButton(
        context: context,
        title: 'history'.tr(),
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
                  return ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      showHistory.state == ShowHistoryState.visible
                          ? showHistory.state = ShowHistoryState.invisible
                          : showHistory.state = ShowHistoryState.visible;
                    },
                    children: [
                      for (final item in data.data) ...[
                        ExpansionPanel(
                          headerBuilder: (BuildContext ctx, bool isExpand) {
                            return ListTile(
                              title: FrizText(
                                text: 'sign_up_to_doctor'.tr(),
                                size: 18,
                              ),
                              subtitle: HelveticaText(
                                text: item.visitDate,
                                size: 14,
                                color: subtitleColor,
                              ),
                            );
                          },
                          body: Container(
                            child: Column(
                              children: [
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
                          isExpanded:
                              showHistory.state == ShowHistoryState.visible
                                  ? true
                                  : false,
                        ),
                      ]
                    ],
                  );
                  /*return ListView(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      for (final item in data.data) ...[
                        ListTile(
                          title: Text(item.symptoms),
                        ),
                      ]
                    ],
                  );*/
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
