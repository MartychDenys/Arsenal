import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FileListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;

  FileListItem({this.title, this.subtitle, this.iconPath});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset('$iconPath'),
      title: Text(
        '$title',
        style: TextStyle(
            fontFamily: 'FrizQuadrataCTT',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color.fromRGBO(40, 46, 58, 1)),
      ),
      subtitle: Text(
        '$subtitle',
        style: TextStyle(
            fontFamily: 'FrizQuadrataCTT',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(96, 110, 117, 1)),
      ),
      trailing: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        onPressed: () {},
        color: Color.fromRGBO(18, 151, 71, 1),
        child: Text(
          AppLocalizations.of(context).translate('details'),
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'HelveticaRegular',
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
