import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final resetPasswordPhoneFormKeyProvider =
    Provider.autoDispose<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
);
