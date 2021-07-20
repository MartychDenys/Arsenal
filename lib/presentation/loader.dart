import 'package:flutter/material.dart';

import 'constants/style_constants.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
        backgroundColor: mainColor,
      ),
    );
  }
}
