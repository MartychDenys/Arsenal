import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhonePopup {
  static Future<dynamic> popup({
    BuildContext context,
  }) {
    var phones = [
      '0800 60 44 54',
      '044 545 75 00',
      '050 332 50 37',
      '067 511 26 35'
    ];

    Future<void> _makePhoneCall(num) async {
      if (await canLaunch('tel:$num')) {
        await launch('tel:$num');
      } else {
        throw 'Could not launch $num';
      }
    }

    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0),
              ),
            ),
            //margin: const EdgeInsets.only(top: 5, left: 15, right: 15),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoActionSheetAction(
                    child: Text(phones[0]),
                    isDefaultAction: true,
                    onPressed: () {
                      _makePhoneCall(phones[0]);
                    },
                  ),
                  Divider(
                    height: 0.5,
                  ),
                  CupertinoActionSheetAction(
                    child: Text(phones[1]),
                    isDefaultAction: true,
                    onPressed: () {
                      _makePhoneCall(phones[1]);
                    },
                  ),
                  Divider(
                    height: 0.5,
                  ),
                  CupertinoActionSheetAction(
                    child: Text(phones[2]),
                    isDefaultAction: true,
                    onPressed: () {
                      _makePhoneCall(phones[2]);
                    },
                  ),
                  Divider(
                    height: 0.5,
                  ),
                  CupertinoActionSheetAction(
                    child: Text(phones[3]),
                    isDefaultAction: true,
                    onPressed: () {
                      _makePhoneCall(phones[3]);
                    },
                  ),
                ]),
          );
        });
  }
}
