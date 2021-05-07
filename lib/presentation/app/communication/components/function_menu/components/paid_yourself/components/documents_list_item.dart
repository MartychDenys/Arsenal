import 'package:flutter/material.dart';

import '../../../../../../../constants/spacers.dart';
import '../../../../../../../constants/style_constants.dart';
import '../../../../../../components/helvetica_text.dart';

class DocumentsListItem extends StatelessWidget {
  const DocumentsListItem(
    this.listNumber,
    this.description,
  );

  final int listNumber;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelveticaText(
            text: '$listNumber.',
            size: 14,
            color: textColor,
            height: 1.5,
          ),
          SpaceH4(),
          Expanded(
            child: HelveticaText(
              text: '$description',
              size: 14,
              color: subtitleColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
