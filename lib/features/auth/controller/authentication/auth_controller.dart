import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_controller_state.dart';

class AuthController extends StateNotifier<AuthControllerState> {
  AuthController() : super(const AuthControllerInit());

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> checkAuth() async {
    state = const AuthControllerInit();
    auth.idTokenChanges().listen(
      (User? user) {
        if (user == null) {
          state = const AuthControllerNoAuth();
        } else {
          state = const AuthControllerReady();
        }
      },
    );
  }
}

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthControllerState>(
  (ref) => AuthController(),
);
