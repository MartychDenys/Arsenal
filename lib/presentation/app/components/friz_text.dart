import 'package:flutter/material.dart';

import '../../constants/style_constants.dart';

class FrizText extends StatelessWidget {
  const FrizText({
    Key key,
    @required this.text,
    @required this.size,
    this.color,
    this.weight = FontWeight.w700,
    this.align = TextAlign.start,
  }) : super(key: key);

  final String text;
  final double size;
  final FontWeight weight;
  final TextAlign align;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        fontFamily: 'FrizQuadrataCTT',
        letterSpacing: letterSpacing,
      ),
    );
  }
}
