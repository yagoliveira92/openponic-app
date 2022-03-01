import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_controller_state.dart';

class LoginController extends StateNotifier<LoginControllerState> {
  LoginController() : super(const LoginControllerInit());

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const LoginControllerLoading();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      state = const LoginControllerSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        state =
            const LoginControllerError(errorMessage: 'Usuário não encontrado');
      } else if (e.code == 'wrong-password') {
        state = const LoginControllerError(
            errorMessage: 'Usuário ou senha errados');
      }
    }
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginControllerState>(
  (ref) => LoginController(),
);
