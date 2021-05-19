import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../components/friz_text.dart';
import '../../../../components/helvetica_text.dart';
import '../../../../../constants/spacers.dart';
import '../../../../../constants/style_constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserInfoCard extends HookWidget {
  const UserInfoCard({
    Key key,
    @required this.userName,
    @required this.userCode,
    @required this.color,
    @required this.onTap,
  }) : super(key: key);

  final String userName;
  final String userCode;
  final Color color;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 32,
        height: 260,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: mainColorDark,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/user_card_background.png',
            ),
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.color,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FrizText(
                  text: userName,
                  size: 14,
                  color: Colors.white,
                ),
              ],
            ),
            SpaceH30(),
            Column(
              children: [
                QrImage(
                  //data: contact.data.fullName + contact.data.userCode,
                  data: userName + userCode,
                  size: 85,
                  backgroundColor: Colors.white,
                  foregroundColor: mainColor,
                ),
                SpaceH18(),
                HelveticaText(
                  text: 'service_number'.tr(),
                  size: 12,
                  color: Colors.white,
                ),
                SpaceH2(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userCode,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: 'HelveticaRegular',
                      ),
                    ),
                    SpaceH10(),
                    Container(
                      width: 16,
                      height: 16,
                      child: GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(
                              text: userCode,
                            ),
                          );
                        },
                        child: SvgPicture.asset(
                          copy,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
