import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallMenuItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final Widget messenger;
  final Color buttonColor;

  CallMenuItem(
      {@required this.title,
      @required this.iconPath,
      this.messenger,
      @required this.buttonColor});

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
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return messenger;
                  },
                );
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
          SizedBox(
            height: 12,
          ),
          Text(title),
        ],
      ),
    );
  }
}
