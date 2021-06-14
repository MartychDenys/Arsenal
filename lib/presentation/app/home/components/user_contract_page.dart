import 'package:arsenal_app/domain/insurance/insurance_data.dart';
import 'package:arsenal_app/presentation/constants/style_constants.dart';

import '../../components/friz_text.dart';
import 'package:expandable/expandable.dart';
import '../../communication/components/history/components/insurer_panel.dart';
import '../../../constants/spacers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'communicate_widget.dart';

class UserContractPage extends HookWidget {
  const UserContractPage({
    Key key,
    @required this.item,
  }) : super(key: key);

  final InsuranceData item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'insurance contract'.tr(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'FrizQuadrataCTT',
            color: Color.fromRGBO(40, 46, 58, 1),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(40, 46, 58, 1),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // top part
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'voluntary_health_insurance'.tr(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'FrizQuadrataCTT',
                        color: Color.fromRGBO(40, 46, 58, 1),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'contract'.tr(),
                          style: TextStyle(
                            color: Color.fromRGBO(96, 110, 117, 1),
                            fontFamily: 'HelveticaRegular',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.dealInfo.title,
                          style: TextStyle(
                            color: Color.fromRGBO(96, 110, 117, 1),
                            fontFamily: 'HelveticaRegular',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SpaceH8(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'contract_valid_from'.tr(),
                          style: TextStyle(
                            color: Color.fromRGBO(96, 110, 117, 1),
                            fontFamily: 'HelveticaRegular',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.dealInfo.beginDate.split(' ')[0],
                          style: TextStyle(
                            color: Color.fromRGBO(96, 110, 117, 1),
                            fontFamily: 'HelveticaRegular',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SpaceH8(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'contract_valid_to'.tr(),
                          style: TextStyle(
                            color: Color.fromRGBO(96, 110, 117, 1),
                            fontFamily: 'HelveticaRegular',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.dealInfo.closeDate.split(' ')[0],
                          style: TextStyle(
                            color: Color.fromRGBO(96, 110, 117, 1),
                            fontFamily: 'HelveticaRegular',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SpaceH8(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'contract_limit'.tr(),
                          style: TextStyle(
                            color: Color.fromRGBO(96, 110, 117, 1),
                            fontFamily: 'HelveticaRegular',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.dealInfo.dmsLimit + ' ' + 'uah'.tr(),
                          style: TextStyle(
                            color: Color.fromRGBO(96, 110, 117, 1),
                            fontFamily: 'HelveticaRegular',
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SpaceH24(),
                    Divider(
                      height: 1,
                      color: Color.fromRGBO(227, 227, 229, 1),
                    ),
                  ],
                ),
              ),
              SpaceH20(),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: InsurerPanel(),
              ),
              Divider(
                height: 1,
                color: Color.fromRGBO(227, 227, 229, 1),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ExpandablePanel(
                  header: FrizText(
                    text: 'insured'.tr(),
                    size: 18,
                  ),
                  collapsed: Text(''),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < item.contactInfo.length; i++) ...[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'username'.tr(),
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: item.contactInfo[i].fullName,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpaceH16(),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'phone_number'.tr() + ': ',
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: item.contactInfo[i].phone,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpaceH16(),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'birth_date'.tr(),
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: (item.contactInfo[i].birthDate)
                                    .substring(0, 10),
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpaceH16(),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'service_number'.tr() + ': ',
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: item.contactInfo[i].dmsUserCode,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpaceH32(),
                      ]
                    ],
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: Color.fromRGBO(227, 227, 229, 1),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ExpandablePanel(
                  header: FrizText(
                    text: 'period_of_validity_contract'.tr(),
                    size: 18,
                  ),
                  collapsed: Text(''),
                  expanded: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 16,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'valid_to'.tr(),
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item.dealInfo.closeDate.substring(0, 10),
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: Color.fromRGBO(227, 227, 229, 1),
              ),
              /*Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ExpandablePanel(
                  header: FrizText(
                    text: 'insurance_program'.tr(),
                    size: 18,
                  ),
                  collapsed: Text(''),
                  expanded: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'insurance_program'.tr() + ': ',
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: item.dealProducts[0].name,
                              style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
              ),*/
              Divider(
                height: 1,
                color: Color.fromRGBO(227, 227, 229, 1),
              ),
              /*Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ExpandablePanel(
                  header: FrizText(
                    text: 'program_options'.tr(),
                    size: 18,
                  ),
                  collapsed: Text(''),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0;
                          i < item.dealProducts[0].limits.length;
                          i++) ...[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: item.dealProducts[0].limits[i].name,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpaceH16(),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'limit'.tr() + ': ',
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: item.dealProducts[0].limits[i].limitSum,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpaceH32(),
                      ]
                    ],
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: Color.fromRGBO(227, 227, 229, 1),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: ExpandablePanel(
                  header: FrizText(
                    text: 'exclusion_from_insurance'.tr(),
                    size: 18,
                  ),
                  collapsed: Text(''),
                  expanded: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0;
                          i < item.dealProducts[0].exclusions.length;
                          i++) ...[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: item.dealProducts[0].exclusions[i].name,
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SpaceH32(),
                      ]
                    ],
                  ),
                ),
              ),*/
              SpaceH32(),
              CommunicateWidget(),
              SpaceH10(),
            ],
          ),
        ),
      ),
    );
  }
}
