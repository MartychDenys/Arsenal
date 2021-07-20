import 'package:flutter/material.dart';

import '../../app/components/helvetica_text.dart';
import '../../constants/spacers.dart';
import '../../constants/style_constants.dart';

class PolicyText extends StatelessWidget {
  const PolicyText({
    @required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HelveticaText(
          text: title,
          size: 14,
          color: subtitleColor,
          height: 1.5,
        ),
        SpaceH16(),
      ],
    );
  }
}
