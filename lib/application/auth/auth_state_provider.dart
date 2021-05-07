import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/auth_state.dart';

final authStateProvider = StateProvider.autoDispose<AuthState>(
  (ref) => AuthState.login,
);
