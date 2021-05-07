import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/auth/auth_data.dart';

final authDataStateNotifierProvider =
    StateNotifierProvider<AuthDataStateNotifier>(
  (ref) => AuthDataStateNotifier(),
);

class AuthDataStateNotifier extends StateNotifier<AuthData> {
  AuthDataStateNotifier() : super(null);

  void updateAuthData(AuthData authData) {
    state = AuthData(
      status: authData.status,
      data: authData.data,
    );
  }

  void resetAuthData() {
    state = null;
  }
}
