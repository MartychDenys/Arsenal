import '../../../domain/auth/show_password_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final showPasswordStateProvider = StateProvider.autoDispose<ShowPasswordState>(
  (ref) => ShowPasswordState.invisible,
);
