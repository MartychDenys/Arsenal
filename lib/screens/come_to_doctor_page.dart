import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:arsenal_app/widgets/dialogs/doctor_confirm_dialog.dart';
import 'package:flutter/material.dart';

class ComeToDoctorPage extends StatelessWidget {
  static const routeName = '/visitDoctor';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          AppLocalizations.of(context).translate('message_sign'),
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  AppLocalizations.of(context).translate('add_to_insurance'),
                  style: TextStyle(
                    fontFamily: 'HelveticaRegular',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(96, 110, 117, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 32,
              ),
              symphtomsWidget(context),
              SizedBox(
                height: 48,
              ),
              Text(
                AppLocalizations.of(context).translate('desired_date'),
                style: TextStyle(
                  fontFamily: 'FrizQuadrataCTT',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color.fromRGBO(40, 46, 58, 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context).translate('date'),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          fontFamily: 'HelveticaRegular',
                          color: Color.fromRGBO(96, 110, 117, 1)),
                    ),
                    Container(
                      width: 160,
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          hintText: 'дд.мм.гггг',
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            color: Color.fromRGBO(18, 151, 71, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).translate('time'),
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        fontFamily: 'HelveticaRegular',
                        color: Color.fromRGBO(96, 110, 117, 1)),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: 70,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '13:30',
                          ),
                        ),
                      ),
                      Text(
                        ' - ',
                        style: TextStyle(
                            fontFamily: 'HelveticaRegular',
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        height: 30,
                        width: 70,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '15:30',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 45,
              ),
              Text(
                AppLocalizations.of(context).translate('medical institution'),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'FrizQuadrataCTT',
                  color: Color.fromRGBO(40, 46, 58, 1),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context).translate('set_institution'),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                AppLocalizations.of(context).translate('doctor_name'),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'FrizQuadrataCTT',
                  color: Color.fromRGBO(40, 46, 58, 1),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context).translate('set_doctor_name'),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              Text.rich(
                TextSpan(
                    text: AppLocalizations.of(context).translate('coment'),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'FrizQuadrataCTT',
                      color: Color.fromRGBO(40, 46, 58, 1),
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: AppLocalizations.of(context)
                            .translate('not_needed'),
                        style: TextStyle(
                          color: Color.fromRGBO(96, 110, 117, 1),
                          fontFamily: 'HelveticaRegular',
                          fontSize: 12,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context).translate('add_more_info'),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return DoctorConfirmDialog();
                      },
                    );
                  },
                  color: Color.fromRGBO(18, 151, 71, 1),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 17),
                    child: Text(
                      AppLocalizations.of(context)
                          .translate('signing_up_to_doctor'),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'HelveticaRegular',
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget symphtomsWidget(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context).translate('bothering'),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            fontFamily: 'FrizQuadrataCTT',
            color: Color.fromRGBO(40, 46, 58, 1),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).translate('symptoms'),
          ),
        ),
      ],
    );
  }
}
