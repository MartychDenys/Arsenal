import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:arsenal_app/widgets/communicate_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserContractPage extends StatelessWidget {
  static const routeName = '/user_contract';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          AppLocalizations.of(context).translate('insurance contract'),
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
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // top part
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)
                        .translate('voluntary_health_insurance'),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'FrizQuadrataCTT',
                      color: Color.fromRGBO(40, 46, 58, 1),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    AppLocalizations.of(context).translate('contract') +
                        ' #156/20 - ДМС/Ц8',
                    style: TextStyle(
                      color: Color.fromRGBO(96, 110, 117, 1),
                      fontFamily: 'HelveticaRegular',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('kyiv'),
                        style: TextStyle(
                          color: Color.fromRGBO(96, 110, 117, 1),
                          fontFamily: 'HelveticaRegular',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '23.03.2020',
                        style: TextStyle(
                          color: Color.fromRGBO(96, 110, 117, 1),
                          fontFamily: 'HelveticaRegular',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    AppLocalizations.of(context).translate('insuranse_example'),
                    style: TextStyle(
                      color: Color.fromRGBO(40, 46, 58, 1),
                      fontFamily: 'HelveticaRegular',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    height: 48,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)
                            .translate('insurance_terms'),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'FrizQuadrataCTT',
                          color: Color.fromRGBO(40, 46, 58, 1),
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        color: Color.fromRGBO(18, 151, 71, 1),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            AppLocalizations.of(context).translate('review'),
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
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    height: 1,
                    color: Color.fromRGBO(227, 227, 229, 1),
                  ),
                ],
              ),
            ),
            // bottom part
            CommunicateWidget(),
          ],
        ),
      ),
    );
  }
}
