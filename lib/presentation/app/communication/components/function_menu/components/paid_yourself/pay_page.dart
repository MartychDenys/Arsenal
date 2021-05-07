import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/spacers.dart';
import '../../../../../../constants/style_constants.dart';
import '../../../../../components/app_bar_with_back_button.dart';
import '../../../../../components/helvetica_text.dart';
import '../../../alarm_documents.dart';
import 'components/custom_divider.dart';
import 'components/documents_list.dart';
import 'components/file_list_item.dart';
import 'components/questions_widget.dart';

class PayPage extends StatelessWidget {
  static const routeName = '/pay';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBackButton(
        context: context,
        title: 'docs_list'.tr(),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: HelveticaText(
                text: 'refund_doc'.tr(),
                size: 13,
                color: subtitleColor,
                align: TextAlign.center,
                height: 1.5,
              ),
            ),
            FileListItem(
              title: 'statement_dmc'.tr(),
              subtitle: 'file_size'.tr() + ' 19mb',
              iconPath: 'assets/icons/pdf.svg',
            ),
            CustomDivider(),
            FileListItem(
              title: 'statement_dmc'.tr(),
              subtitle: 'file_size'.tr() + ' 19mb',
              iconPath: 'assets/icons/doc.svg',
            ),
            CustomDivider(),
            DocumentList(),
            SpaceH30(),
            DocumentsAlarm(),
            SpaceH45(),
            QuestionsWidget(),
            SpaceH20(),
          ],
        ),
      ),
    );
  }
}
