import 'package:flutter/material.dart';

import '../../constants/style_constants.dart';
import 'friz_text.dart';

AppBar appBarWithBackButton({
  @required BuildContext context,
  @required String title,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.5,
    title: FrizText(
      text: title,
      color: textColor,
      size: 18,
    ),
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: textColor,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}
