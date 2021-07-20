import 'package:flutter/material.dart';

import '../snack_bar.dart';

void showMessageSnackBar({
  String message,
  Color color,
  GlobalKey<ScaffoldState> scaffoldKey,
}) {
  ScaffoldMessenger.of(scaffoldKey.currentContext).showSnackBar(
    snackBar(message, color),
  );
}
