import 'dart:io';

import 'package:flutter/foundation.dart';

class ProvideConclusionRequest {
  ProvideConclusionRequest({
    @required this.visitDate,
    @required this.image,
    this.comment,
  });

  final String visitDate, comment;
  final File image;
}