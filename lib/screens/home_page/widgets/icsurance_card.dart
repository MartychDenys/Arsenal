import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class InsuranceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).translate('health'),
            style: TextStyle(
              fontFamily: 'FrizQuadrataCTT',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Color.fromRGBO(40, 46, 58, 1),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            AppLocalizations.of(context)
                .translate('your_insurances_by_category'),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(96, 110, 117, 1),
              fontFamily: 'HelveticaRegular',
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 170,
            //padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromRGBO(33, 150, 83, 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)
                            .translate('voluntary_health_insurance'),
                        style: TextStyle(
                          fontFamily: 'FrizQuadrataCTT',
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)
                              .translate('insurance_sum'),
                          style: TextStyle(
                            fontFamily: 'HelveticaRegular',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '600 000 грн',
                              style: TextStyle(
                                fontFamily: 'HelveticaRegular',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)
                              .translate('ins_valid_to'),
                          style: TextStyle(
                            fontFamily: 'HelveticaRegular',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          children: <InlineSpan>[
                            TextSpan(
                              text: '22.11.2020',
                              style: TextStyle(
                                fontFamily: 'HelveticaRegular',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text.rich(
                        TextSpan(
                          text: AppLocalizations.of(context)
                              .translate('view_contract'),
                          style: TextStyle(
                            fontFamily: 'HelveticaRegular',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushNamed('/user_contract');
                            },
                        ),
                      ),
                    ],
                  ),
                ),
                //bottom pulse image
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/user_contract');
                  },
                  child: Align(
                    alignment: Alignment(-0.7, 1),
                    child: Image.asset(
                      'assets/images/pulse.png',
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(1, -0.7),
                  child: Image.asset('assets/images/pulse.png'),
                ),
                Align(
                  alignment: Alignment(1, 0.4),
                  child: Image.asset(
                    'assets/images/tablets.png',
                    width: 84,
                    height: 109,
                  ),
                ),
                Align(
                  alignment: Alignment(0.7, 0.8),
                  child: Image.asset(
                    'assets/images/pills.png',
                    width: 77,
                    height: 60,
                  ),
                ),
                Align(
                  alignment: Alignment(0.65, -0.65),
                  child: Image.asset(
                    'assets/images/heart.png',
                    width: 41,
                    height: 41,
                  ),
                ),
                Align(
                  alignment: Alignment(0.3, 0.5),
                  child: Image.asset(
                    'assets/images/heart.png',
                    width: 41,
                    height: 41,
                  ),
                ),
                Align(
                  alignment: Alignment(0.9, 0.6),
                  child: Image.asset(
                    'assets/images/heart.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
