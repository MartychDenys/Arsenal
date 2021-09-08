import 'package:flutter/material.dart';

void showCustomDialog({
  @required BuildContext context,
  @required Widget child,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: child,
    ),
  );
}