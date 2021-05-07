import 'package:flutter/material.dart';

SnackBar snackBar(String text, Color color) {
  return SnackBar(
    content: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: const Duration(
      seconds: 2,
    ),
    backgroundColor: color,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
    ),
  );
}
