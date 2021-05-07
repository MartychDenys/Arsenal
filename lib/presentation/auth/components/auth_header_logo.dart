import 'package:flutter/material.dart';

import '../../constants/style_constants.dart';

class AuthHeaderLogo extends StatelessWidget {
  const AuthHeaderLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 283,
      child: Stack(
        children: [
          Container(
            height: 203,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  logoBackgroundImage,
                ),
                colorFilter: ColorFilter.mode(
                  headerBackgroundColor,
                  BlendMode.color,
                ),
              ),
            ),
          ),
          const Align(
            child: Image(
              width: 148,
              height: 148,
              image: AssetImage(
                logoImage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
