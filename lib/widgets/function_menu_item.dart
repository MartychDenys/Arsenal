import 'package:flutter/material.dart';

class FunctionMenuItem extends StatelessWidget {
  final String buttonTitle;
  final String title;
  final Function buttonFunc;

  FunctionMenuItem(
      {@required this.buttonTitle,
      @required this.title,
      @required this.buttonFunc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'FrizQuadrataCTT',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color.fromRGBO(40, 46, 58, 1),
                ),
              ),
            ),
            Container(
              width: 120,
              child: RaisedButton(
                onPressed: buttonFunc,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                color: Color.fromRGBO(18, 151, 71, 1),
                child: Text(
                  buttonTitle,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'HelveticaRegular',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
