import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../constants/style_constants.dart';
import '../../../../../../components/friz_text.dart';
import '../../../../../../components/helvetica_text.dart';

class FileListItem extends StatelessWidget {
  const FileListItem({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.iconPath,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset('$iconPath'),
      title: FrizText(
        text: '$title',
        size: 18,
        color: textColor,
      ),
      subtitle: FrizText(
        text: '$subtitle',
        size: 14,
        color: subtitleColor,
        weight: FontWeight.w400,
      ),
      trailing: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        onPressed: () {},
        color: mainColor,
        child: HelveticaText(
          text: 'details'.tr(),
          size: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
