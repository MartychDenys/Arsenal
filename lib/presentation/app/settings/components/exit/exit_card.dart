import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/style_constants.dart';
import '../../../components/dialog.dart';

class ExitCard extends HookWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        child: ListTile(
          leading: leadingIcon(),
          title: Text(
            'exit'.tr(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'FrizQuadrataCTT',
              fontSize: 14,
              color: Color.fromRGBO(40, 46, 58, 1),
            ),
          ),
          subtitle: Text(
            'functions_off'.tr(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: 'HelveticaRegular',
              color: Color.fromRGBO(96, 110, 117, 1),
            ),
          ),
          trailing: ButtonTheme(
            minWidth: 34,
            height: 34,
            child: FlatButton(
              onPressed: () async {
                /*await authData.resetAuthData();
                controller.state = ControllerState.unauthorized;*/
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MainDialog(
                      title: 'are_you_sure'.tr(),
                      subtitle: 'you_always'.tr(),
                      mainButtonText: 'exit_app'.tr(),
                      secondButtonText: 'cancel'.tr(),
                      secondButtonAction: () {
                        Navigator.of(context).pop();
                      },
                      iconPath: exit,
                    );
                  },
                );
              },
              color: Color.fromRGBO(18, 151, 71, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget leadingIcon() {
    return Container(
      padding: EdgeInsets.all(10),
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: Color.fromRGBO(96, 110, 117, 1),
        borderRadius: BorderRadius.circular(2.7),
      ),
      child: SvgPicture.asset(
        'assets/icons/exit.svg',
      ),
    );
  }
}
