import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/spacers.dart';

class CallMenuItem extends StatelessWidget {
  const CallMenuItem({
    @required this.title,
    @required this.iconPath,
    @required this.buttonColor,
    @required this.onPressButton,
  });

  final String title;
  final String iconPath;
  final Color buttonColor;
  final Function() onPressButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ButtonTheme(
            minWidth: 65,
            height: 65,
            //shape: ,
            child: FlatButton(
              onPressed: () {
                onPressButton();
              },
              color: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Center(
                child: SvgPicture.asset('$iconPath'),
              ),
            ),
          ),
          SpaceH12(),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
