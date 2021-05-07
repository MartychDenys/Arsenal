import 'package:flutter/material.dart';

void navigatorPush(BuildContext context, Widget pageToPush) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => pageToPush,
    ),
  );
}

void navigatorPushReplacement(BuildContext context, Widget pageToPush) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => pageToPush,
    ),
  );
}
