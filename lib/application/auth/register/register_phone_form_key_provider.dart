import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerPasswordPhoneFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
);
