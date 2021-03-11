import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:arsenal_app/widgets/insurance_details.dart';
import 'package:arsenal_app/widgets/questions_widget.dart';
import 'package:flutter/material.dart';

class InsuranceContractPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          AppLocalizations.of(context).translate('policies'),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'FrizQuadrataCTT',
            color: Color.fromRGBO(40, 46, 58, 1),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(40, 46, 58, 1),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InsuranceDetails(),
            QuestionsWidget(),
          ],
        ),
      ),
    );
  }
}
