import 'package:flutter/material.dart';

import '../../../../../constants/style_constants.dart';

class UserCardBackground extends StatelessWidget {
  const UserCardBackground({
    Key key,
    this.child,
  }) : super(key: key);

  final List<Widget> child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            userCardBackground,
            BlendMode.color,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          24,
        ),
        child: Column(
          children: child,
        ),
      ),
    );
  }
}
