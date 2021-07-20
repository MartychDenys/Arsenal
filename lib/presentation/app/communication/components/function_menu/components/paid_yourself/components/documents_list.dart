import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../../constants/style_constants.dart';
import '../../../../../../components/friz_text.dart';
import '../../../../../../components/helvetica_text.dart';
import 'documents_list_item.dart';

class DocumentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              top: 30,
            ),
            child: FrizText(
              text: 'docs_list'.tr(),
              size: 18,
              color: textColor,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              top: 4,
            ),
            child: HelveticaText(
              text: 'docs_list_to_refund'.tr(),
              size: 12,
              color: subtitleColor,
            ),
          ),
          DocumentsListItem(
            1,
            'docs_list_details_1'.tr(),
          ),
          DocumentsListItem(
            2,
            'docs_list_details_2'.tr(),
          ),
          DocumentsListItem(
            3,
            'docs_list_details_3'.tr(),
          ),
          DocumentsListItem(
            4,
            'docs_list_details_4'.tr(),
          ),
          DocumentsListItem(
            5,
            'docs_list_details_5'.tr(),
          ),
          DocumentsListItem(
            6,
            'docs_list_details_6'.tr(),
          ),
          DocumentsListItem(
            7,
            'docs_list_details_7'.tr(),
          ),
        ],
      ),
    );
  }
}
