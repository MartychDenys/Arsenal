import '../../../../../../../domain/history/confirmed_item.dart';
import '../../../../../components/friz_text.dart';
import '../../../../../components/helvetica_text.dart';
import '../../../../../../constants/spacers.dart';
import '../../../../../../constants/style_constants.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class HistoryTile extends StatelessWidget {
  const HistoryTile({
    Key key,
    @required this.historyTile,
  }): super(key: key);

  final ConfirmedItem historyTile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ExpandablePanel(
        header: FrizText(
          text: 'sign_up_to_doctor'.tr(),
          size: 18,
        ),
        collapsed: HelveticaText(
          text: historyTile.visitDate,
          size: 14,
          color: subtitleColor,
        ),
        expanded: Container(
          child: Column(
            children: [
              Row(
                children: [
                  FrizText(
                    text: 'date'.tr() + ': ',
                    size: 14,
                  ),
                  HelveticaText(
                    text: historyTile.visitDate,
                    size: 14,
                    color: textColor,
                  ),
                ],
              ),
              SpaceH16(),
              Row(
                children: [
                  FrizText(
                    text: 'complaints'.tr() + ': ',
                    size: 14,
                  ),
                  HelveticaText(
                    text: historyTile.symptoms,
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
                    text: historyTile.visitTime,
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
                    text: historyTile.visitDate,
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
                    text: historyTile.medInstitution,
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
                    text: historyTile.comment,
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
      ),
    );
  }
}