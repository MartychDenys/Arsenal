import 'package:flutter/material.dart';

import '../../../../../constants/style_constants.dart';
import '../../../../components/friz_text.dart';
import '../../../../components/helvetica_text.dart';

class FunctionMenuItem extends StatelessWidget {
  const FunctionMenuItem({
    Key key,
    @required this.buttonTitle,
    @required this.title,
    @required this.buttonFunc,
  }) : super(key: key);

  final String buttonTitle;
  final String title;
  final Function() buttonFunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: FrizText(
                text: title,
                size: 18,
                color: textColor,
              ),
            ),
            Container(
              width: 120,
              child: RaisedButton(
                onPressed: buttonFunc,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    7.0,
                  ),
                ),
                color: mainColor,
                child: HelveticaText(
                  text: buttonTitle,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
