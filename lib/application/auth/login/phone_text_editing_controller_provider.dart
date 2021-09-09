import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final phoneTextEditingControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());
final passwordTextEditingControllerProvider = StateProvider<TextEditingController>((ref) => TextEditingController());