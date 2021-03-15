import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DocumentsAlarm extends StatelessWidget {
  final FontWeight fontWeight;

  DocumentsAlarm({this.fontWeight});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Color.fromRGBO(245, 245, 245, 1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            child: SvgPicture.asset('assets/icons/alarm.svg'),
            padding: EdgeInsets.only(right: 12),
          ),
          Expanded(
            child: Text(
              AppLocalizations.of(context).translate('how_to_sent'),
              style: TextStyle(
                height: 1.5,
                fontWeight: fontWeight,
                fontSize: 13,
                fontFamily: 'HelveticaRegular',
                color: Color.fromRGBO(96, 110, 117, 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
