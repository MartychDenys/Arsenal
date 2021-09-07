import 'dart:io';

import '../../../../domain/provide_conclusion/provide_conclusion_request.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final provideConclusionStateNotifier =
StateNotifierProvider.autoDispose<ProvideConclusionStateNotifier>(
      (ref) => ProvideConclusionStateNotifier(),
);

class ProvideConclusionStateNotifier extends StateNotifier<ProvideConclusionRequest> {
  ProvideConclusionStateNotifier()
      : super(
    ProvideConclusionRequest(
      visitDate: null,
      image: null,
      comment: null,
    ),
  );

  void updateVisitDate(String visitDate) {
    state = ProvideConclusionRequest(
      visitDate: visitDate,
      image: state.image,
      comment: state.comment,
    );
  }

  void updateImage(File image) {
    state = ProvideConclusionRequest(
      visitDate: state.visitDate,
      image: image,
      comment: state.comment,
    );
  }

  void updateComment(String comment) {
    state = ProvideConclusionRequest(
      visitDate: state.visitDate,
      image: state.image,
      comment: comment,
    );
  }

  void clearFields() {
    state = ProvideConclusionRequest(
      visitDate: null,
      image: null,
      comment: null,
    );
  }

  File get image => state.image;
  String get visitDate => state.visitDate;
}
