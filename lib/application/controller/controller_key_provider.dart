import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final controllerKeyProvider = Provider<GlobalKey<ScaffoldState>>((red) {
  return GlobalKey<ScaffoldState>();
});
