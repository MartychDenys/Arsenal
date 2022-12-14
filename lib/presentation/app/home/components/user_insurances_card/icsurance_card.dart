import '../../../../../application/app/contact/current_contact_state_notifier_provider.dart';
import '../../../../../application/auth/auth_data_state_notifier_provider.dart';
import '../../../../../infrastructure/insurance/insurance_service.dart';
import '../../../components/popups/additional_popup.dart';
import '../../../components/popups/popup_auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:number_display/number_display.dart';

import '../user_contract_page.dart';
import '../../../components/helvetica_text.dart';
import '../../../components/friz_text.dart';
import '../../../../constants/spacers.dart';
import '../../../../constants/style_constants.dart';
import '../../../../navigator_push.dart';
import '../../../../../domain/insurance/insurance_data.dart';

class InsuranceCard extends HookWidget {
  InsuranceCard({
    Key key,
    @required this.insuranceList,
  }) : super(key: key);

  final List<InsuranceData> insuranceList;

  @override
  Widget build(BuildContext context) {
    // final insuranceId = useProvider(insuranceIdStateNotifierProvider);
    //
    // insuranceId.updateInsuranceId(insuranceList[0].dealInfo.id);

    final userId = useProvider(currentContactStateNotifierProvider);
    final authData = useProvider(authDataStateNotifierProvider);

    final numberFormatter = createDisplay(
      separator: ' ',
      length: 9,
      decimal: 0,
    );

    if ((insuranceList[0].dealInfo.dmsLimit) == null ||
        (insuranceList[0].dealInfo.closeDate) == null) {
      return Text('Error data');
    } else {
      return InkWell(
        onTap: () async {
          final insuranceExpired = await InsuranceService().insuranceExpired(
            authData.state.data.token,
            userId.state,
          );

          if (!insuranceExpired) {
            showCustomDialog(
              context: context,
              child: NumberNotFoundPoppup(),
            );
            return;
          }
          navigatorPush(
            context,
            UserContractPage(
              item: insuranceList[0],
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FrizText(
                text: 'health'.tr(),
                size: 18,
                color: textColor,
              ),
              SpaceH4(),
              HelveticaText(
                text: 'your_insurances_by_category'.tr(),
                size: 14,
                color: subtitleColor,
              ),
              SpaceH16(),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: const BoxDecoration(
                  color: userCardBackground,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                        16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FrizText(
                            text: 'voluntary_health_insurance'.tr(),
                            size: 14,
                            color: Colors.white,
                          ),
                          SpaceH18(),
                          Text.rich(
                            TextSpan(
                              text: 'insurance_sum'.tr(),
                              style: const TextStyle(
                                fontFamily: 'HelveticaRegular',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: numberFormatter(int.parse(insuranceList[0].dealInfo.dmsLimit)) +
                                      ' ' + 'uah_per_year'.tr(),
                                  style: TextStyle(
                                    fontFamily: 'HelveticaRegular',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SpaceH4(),
                          Text.rich(
                            TextSpan(
                              text: 'ins_valid_to'.tr(),
                              style: const TextStyle(
                                fontFamily: 'HelveticaRegular',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              children: <InlineSpan>[
                                TextSpan(
                                  text: (insuranceList[0].dealInfo.closeDate)
                                      .substring(0, 10),
                                  style: TextStyle(
                                    fontFamily: 'HelveticaRegular',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SpaceH24(),
                          Text(
                            'view_contract'.tr(),
                            style: const TextStyle(
                              fontFamily: 'HelveticaRegular',
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //bottom pulse image
                    Align(
                      alignment: const Alignment(
                        -0.7,
                        1,
                      ),
                      child: Image.asset(
                        'assets/images/pulse.png',
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(
                        1,
                        -0.7,
                      ),
                      child: Image.asset('assets/images/pulse.png'),
                    ),
                    Align(
                      alignment: const Alignment(
                        1,
                        0.4,
                      ),
                      child: Image.asset(
                        'assets/images/tablets.png',
                        width: 84,
                        height: 109,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(
                        0.7,
                        0.8,
                      ),
                      child: Image.asset(
                        'assets/images/pills.png',
                        width: 77,
                        height: 60,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(
                        0.65,
                        -0.65,
                      ),
                      child: Image.asset(
                        'assets/images/heart.png',
                        width: 41,
                        height: 41,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(
                        0.3,
                        0.5,
                      ),
                      child: Image.asset(
                        'assets/images/heart.png',
                        width: 41,
                        height: 41,
                      ),
                    ),
                    Align(
                      alignment: const Alignment(
                        0.9,
                        0.6,
                      ),
                      child: Image.asset(
                        'assets/images/heart.png',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
