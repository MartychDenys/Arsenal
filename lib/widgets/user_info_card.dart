import 'package:arsenal_app/locale/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserInfoCard extends StatelessWidget {
  String serviceNumber = '2193082109383';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/user_card_background.png'),
            colorFilter: ColorFilter.mode(
                Color.fromRGBO(33, 150, 83, 1), BlendMode.color),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              QrImage(
                data: 'фвфц',
                size: 85,
                backgroundColor: Colors.white,
                foregroundColor: Color.fromRGBO(18, 151, 71, 1),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                'Філатов Cергій Олегович',
                style: TextStyle(
                  fontFamily: 'FrizQuadrataCTT',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppLocalizations.of(context).translate('valid_to'),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: 'HelveticaRegular',
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        AppLocalizations.of(context).translate('dateSample'),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontFamily: 'HelveticaRegular',
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        AppLocalizations.of(context)
                            .translate('service_number'),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: 'HelveticaRegular',
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            serviceNumber,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: 'HelveticaRegular',
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 16,
                            height: 16,
                            child: GestureDetector(
                              child: SvgPicture.asset('assets/icons/copy.svg'),
                              onTap: () {
                                Clipboard.setData(
                                    new ClipboardData(text: serviceNumber));
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
