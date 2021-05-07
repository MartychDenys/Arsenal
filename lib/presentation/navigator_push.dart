import 'package:flutter/material.dart';

void navigatorPush(BuildContext context, Widget pageToPush) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => pageToPush,
    ),
  );
}
