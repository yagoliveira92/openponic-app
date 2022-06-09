import 'package:app_openponic/features/auth/controller/authentication/auth_controller.dart';
import 'package:app_openponic/features/auth/controller/authentication/auth_controller_state.dart';
import 'package:app_openponic/features/auth/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ref.read(authControllerProvider.notifier).checkAuth(),
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthControllerState>(authControllerProvider, (prev, next) {
      if (next is AuthControllerReady) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/initial-screen', (Route<dynamic> route) => false);
      }
    });
    return Consumer(
      builder: (context, watch, child) {
        final state = ref.watch(authControllerProvider);
        if (state is AuthControllerNoAuth) {
          return const LoginScreen();
        }
        return const Scaffold(
          body: Center(
            child: SizedBox.square(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
