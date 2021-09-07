import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final provideConclusionFormKeyProvider = Provider.autoDispose<GlobalKey<FormState>>(
      (ref) => GlobalKey<FormState>(),
);