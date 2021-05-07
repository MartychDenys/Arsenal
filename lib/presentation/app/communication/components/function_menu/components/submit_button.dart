import 'package:flutter/material.dart';

import '../../../../../constants/style_constants.dart';
import '../../../../components/helvetica_text.dart';
import '../../doctor_dialog.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key key,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            5,
          ),
        ),
        onPressed:
            /*() {

          showDialog(
            context: context,
            builder: (BuildContext ctx) {
              return DoctorDialog();
            },
          );
        }*/
            onTap,
        color: mainColor,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 17,
          ),
          child: HelveticaText(
            text: title,
            size: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
