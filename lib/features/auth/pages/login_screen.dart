import 'package:app_openponic/common/openponic_color.dart';
import 'package:app_openponic/features/auth/controller/login/login_controller.dart';
import 'package:app_openponic/features/auth/controller/login/login_controller_state.dart';
import 'package:app_openponic/features/auth/widgets/email_field_widget.dart';
import 'package:app_openponic/features/auth/widgets/password_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _emailController = TextEditingController(text: '');
    TextEditingController _passwordController = TextEditingController(text: '');
    final state = ref.watch(loginControllerProvider);

    ref.listen<LoginControllerState>(loginControllerProvider, (prev, next) {
      if (next is LoginControllerSuccess) {
        Navigator.pushNamedAndRemoveUntil(
            context, '/initial-screen', (Route<dynamic> route) => false);
      }

      if (next is LoginControllerError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.errorMessage),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          ),
        );
      }
    });

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/image/openponic_logo_full.png',
                      height: 110.0,
                    ),
                    const SizedBox(
                      height: 35.0,
                    ),
                    const Text(
                      'Seja bem vindo!',
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    EmailTextFieldWidget(controller: _emailController),
                    const SizedBox(
                      height: 15.0,
                    ),
                    PasswordTextFieldWidget(controller: _passwordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(13.0),
                        primary: OpenponicColor.green,
                        textStyle: const TextStyle(
                          fontSize: 22.0,
                        ),
                      ),
                      onPressed: () async {
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text.isNotEmpty) {
                          return await ref
                              .read(loginControllerProvider.notifier)
                              .login(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                        }
                      },
                      child: state is LoginControllerLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              'Entrar',
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
