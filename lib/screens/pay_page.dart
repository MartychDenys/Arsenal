import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:arsenal_app/widgets/documents_list.dart';
import 'package:arsenal_app/widgets/file_list_item.dart';
import 'package:arsenal_app/widgets/questions_widget.dart';
import 'package:flutter/material.dart';
import 'alarm_documents.dart';

class PayPage extends StatelessWidget {
  static const routeName = '/pay';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          AppLocalizations.of(context).translate('docs_list'),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'FrizQuadrataCTT',
            color: Color.fromRGBO(40, 46, 58, 1),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(40, 46, 58, 1),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                AppLocalizations.of(context).translate('refund_doc'),
                style: TextStyle(
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  fontFamily: 'HelveticaRegular',
                  color: Color.fromRGBO(96, 110, 117, 1),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            FileListItem(
              title: AppLocalizations.of(context).translate('statement_dmc'),
              subtitle:
                  AppLocalizations.of(context).translate('file_size') + ' 19mb',
              iconPath: 'assets/icons/pdf.svg',
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(227, 227, 229, 1),
            ),
            FileListItem(
              title: AppLocalizations.of(context).translate('statement_dmc'),
              subtitle:
                  AppLocalizations.of(context).translate('file_size') + ' 19mb',
              iconPath: 'assets/icons/doc.svg',
            ),
            Divider(
              height: 1,
              color: Color.fromRGBO(227, 227, 229, 1),
            ),
            DocumentList(),
            SizedBox(
              height: 30,
            ),
            DocumentsAlarm(),
            SizedBox(
              height: 45,
            ),
            QuestionsWidget(),
            SizedBox(
              height: 25,
            )
          ],
        ),
      ),
    );
  }
}
