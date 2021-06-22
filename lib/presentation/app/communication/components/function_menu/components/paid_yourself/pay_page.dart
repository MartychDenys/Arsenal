import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../constants/spacers.dart';
import '../../../../../../constants/style_constants.dart';
import '../../../../../components/app_bar_with_back_button.dart';
import '../../../../../components/helvetica_text.dart';
import '../../../alarm_documents.dart';
import 'components/custom_divider.dart';
import 'components/documents_list.dart';
import 'components/file_list_item.dart';
import 'components/questions_widget.dart';

class PayPage extends HookWidget {
  static const routeName = '/pay';
  @override
  Widget build(BuildContext context) {
    Future<void> _downloadPdf() async {
      if (await canLaunch(Uri.encodeFull('google.com.ua'))) {
        await launch(
          Uri.encodeFull('google.com.ua'),
        );
      } else {
        throw 'Could not launch';
      }
    }

    _downloadDoc() async {
      if (await canLaunch('google.com')) {
        await launch('google.com');
      } else {
        throw 'Could not launch';
      }
    }

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
              subtitle: 'file_size'.tr() + ' 417kb',
              iconPath: 'assets/icons/pdf.svg',
              link:
                  'https://cp.arsenal-strahovanie.com/upload/mobile-app/Zayava-DMS.pdf',
            ),
            CustomDivider(),
            FileListItem(
              title: 'statement_dmc'.tr(),
              subtitle: 'file_size'.tr() + ' 20kb',
              iconPath: 'assets/icons/doc.svg',
              link:
                  'https://cp.arsenal-strahovanie.com/upload/mobile-app/Zayava-DMS.docx',
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
