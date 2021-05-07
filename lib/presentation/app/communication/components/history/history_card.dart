import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/style_constants.dart';
import '../../../components/friz_text.dart';
import '../../../components/helvetica_text.dart';

class HistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 8,
      ),
      child: Card(
        child: ListTile(
          leading: leadingIcon(),
          title: FrizText(
            text: 'history'.tr(),
            size: 14,
            color: textColor,
          ),
          subtitle: HelveticaText(
            text: 'check_history'.tr(),
            size: 12,
            color: subtitleColor,
          ),
          trailing: ButtonTheme(
            minWidth: 34,
            height: 34,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/history');
              },
              color: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: const Icon(
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
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: subtitleColor,
        borderRadius: BorderRadius.circular(
          2.7,
        ),
      ),
      child: const Icon(
        Icons.history,
        color: Colors.white,
      ),
    );
  }
}
