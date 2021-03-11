import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/material.dart';

import 'documents_list_item.dart';

class DocumentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, top: 30),
            child: Text(
              AppLocalizations.of(context).translate('docs_list'),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                fontFamily: 'FrizQuadrataCTT',
                color: Color.fromRGBO(40, 46, 58, 1),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, top: 4),
            child: Text(
              AppLocalizations.of(context).translate('docs_list_to_refund'),
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontFamily: 'HelveticaRegular',
                color: Color.fromRGBO(96, 110, 117, 1),
              ),
            ),
          ),
          DocumentsListItem(
              1, AppLocalizations.of(context).translate('docs_list_details_1')),
          DocumentsListItem(
              2, AppLocalizations.of(context).translate('docs_list_details_2')),
          DocumentsListItem(
              3, AppLocalizations.of(context).translate('docs_list_details_3')),
          DocumentsListItem(
              4, AppLocalizations.of(context).translate('docs_list_details_4')),
          DocumentsListItem(
              5, AppLocalizations.of(context).translate('docs_list_details_5')),
          DocumentsListItem(
              6, AppLocalizations.of(context).translate('docs_list_details_6')),
          DocumentsListItem(
              7, AppLocalizations.of(context).translate('docs_list_details_7')),
        ],
      ),
    );
  }
}
