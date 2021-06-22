import '../../../application/auth/auth_data_state_notifier_provider.dart';
import '../../../application/controller/controller_state_provider.dart';
import '../../../domain/controller/controller_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/spacers.dart';
import '../../constants/style_constants.dart';
import 'friz_text.dart';
import 'helvetica_text.dart';

class MainDialog extends HookWidget {
  const MainDialog({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.mainButtonText,
    @required this.secondButtonText,
    @required this.secondButtonAction,
    @required this.iconPath,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String mainButtonText;
  final String secondButtonText;
  final Function() secondButtonAction;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(controllerStateProvider);
    final authData = useProvider(authDataStateNotifierProvider);

    return AlertDialog(
      title: Center(
        child: Column(
          children: [
            Container(
              width: 42,
              height: 42,
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(18, 151, 71, 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: SvgPicture.asset(iconPath),
            ),
            SpaceH24(),
            FrizText(
              text: title,
              size: 18,
              color: dialog,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
      content: HelveticaText(
        text: subtitle,
        size: 14,
        color: subtitleColor,
        align: TextAlign.center,
      ),
      actions: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      secondButtonAction();
                    },
                    child: HelveticaText(
                      text: secondButtonText,
                      color: textColor,
                      size: 14,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  onPressed: () async {
                    await authData.resetAuthData();
                    controller.state = ControllerState.unauthorized;
                    Navigator.pop(context);
                  },
                  color: mainColor,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 17,
                    ),
                    child: HelveticaText(
                      text: mainButtonText,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
