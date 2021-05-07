import '../../../constants/spacers.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'communicate_widget.dart';

class ExpandedNotifier extends ChangeNotifier {
  bool _isExpand = false;
  bool get isExpand => _isExpand;

  void changeValue() {
    _isExpand = true;
    notifyListeners();
  }
}

class UserContractPage extends HookWidget {
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
                  Text(
                    'contract'.tr() + ' #156/20 - ДМС/Ц8',
                    style: TextStyle(
                      color: Color.fromRGBO(96, 110, 117, 1),
                      fontFamily: 'HelveticaRegular',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SpaceH8(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'kyiv'.tr(),
                        style: TextStyle(
                          color: Color.fromRGBO(96, 110, 117, 1),
                          fontFamily: 'HelveticaRegular',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '23.03.2020',
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
                  Text(
                    'insuranse_example'.tr(),
                    style: TextStyle(
                      color: Color.fromRGBO(40, 46, 58, 1),
                      fontFamily: 'HelveticaRegular',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  SpaceH24(),
                  Divider(
                    height: 1,
                    color: Color.fromRGBO(227, 227, 229, 1),
                  ),
                ],
              ),
            ),
            CommunicateWidget(),
          ],
        ),
      ),
    );
  }
}
