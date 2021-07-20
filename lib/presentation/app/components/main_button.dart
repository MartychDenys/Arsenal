import 'package:flutter/material.dart';

import '../../constants/style_constants.dart';
import 'helvetica_text.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key key,
    @required this.text,
    @required this.onTap,
}) : super(key: key);

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5,
        ),
      ),
      onPressed: onTap,
      color: mainColor,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 17,
        ),
        child: HelveticaText(
          text: text,
          color: Colors.white,
          size: 14,
        ),
      ),
    );
  }
}
