import '../../../../../../../domain/history/conclusion_item.dart';
import '../../../../../../constants/style_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../components/friz_text.dart';
import '../../../../../components/helvetica_text.dart';
import '../../../../../../constants/spacers.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class ConclusionTile extends StatelessWidget {
  ConclusionTile({
    Key key,
    @required this.conclusion,
  }): super(key: key);

  final ConclusionItem conclusion;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ExpandablePanel(
        header: FrizText(
          text: 'doctors_conclusion'.tr(),
          size: 18,
        ),
        collapsed: HelveticaText(
          text: conclusion.date,
          size: 14,
          color: subtitleColor,
        ),
        expanded: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  FrizText(
                    text: 'date'.tr() + ': ',
                    size: 14,
                  ),
                  HelveticaText(
                    text: conclusion.date,
                    size: 14,
                    color: textColor,
                  ),
                ],
              ),
              SpaceH16(),
              if (conclusion.comment != 'null')
                Row(
                  children: [
                    FrizText(
                      text: 'coment'.tr() + ': ',
                      size: 14,
                    ),
                    HelveticaText(
                      text: conclusion.comment,
                      size: 14,
                      color: textColor,
                    ),
                  ],
                ),
             SpaceH16(),
              if (conclusion.photo.toString() != '[]')
                Image.network(createImageNetwork(conclusion.photo))
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

String createImageNetwork(photo) {
    final cat = photo.toString().split('[').last;
    final url = cat.split(']').first;
    print('http://cp.arsenal-strahovanie.com$url');

    if (url.isNotEmpty) {
      return 'http://cp.arsenal-strahovanie.com$url';
    } else {
      return '';
    }
}