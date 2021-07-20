import 'package:flutter/material.dart';

import '../../constants/style_constants.dart';

class HelveticaText extends StatelessWidget {
  const HelveticaText({
    Key key,
    @required this.text,
    @required this.size,
    @required this.color,
    this.weight = FontWeight.w400,
    this.align = TextAlign.start,
    this.height,
  }) : super(key: key);

  final String text;
  final double size;
  final FontWeight weight;
  final TextAlign align;
  final Color color;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        fontFamily: 'HelveticaRegular',
        letterSpacing: letterSpacing,
        height: height,
      ),
    );
  }
}
