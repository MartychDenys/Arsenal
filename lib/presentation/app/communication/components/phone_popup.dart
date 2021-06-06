import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PhonePopup {
  static Future<dynamic> popup({
    BuildContext context,
  }) {
    const phones = [
      '0800 60 44 54',
      '044 545 75 00',
      '050 332 50 37',
      '067 511 26 35'
    ];

    Future<void> _makePhoneCall(num) async {
      launch('tel://${num.replaceAll(new RegExp(r"\s+"), "")}');
    }

    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () {
                      _makePhoneCall(phones[0]);
                    },
                    child: Text(
                      phones[0],
                    ),
                  ),
                  const Divider(
                    height: 0.5,
                  ),
                  CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () {
                      _makePhoneCall(phones[1]);
                    },
                    child: Text(phones[1]),
                  ),
                  const Divider(
                    height: 0.5,
                  ),
                  CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () {
                      _makePhoneCall(phones[2]);
                    },
                    child: Text(phones[2]),
                  ),
                  const Divider(
                    height: 0.5,
                  ),
                  CupertinoActionSheetAction(
                    isDefaultAction: true,
                    onPressed: () {
                      _makePhoneCall(phones[3]);
                    },
                    child: Text(phones[3]),
                  ),
                ]),
          );
        });
  }
}
