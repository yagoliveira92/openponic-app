import 'package:app_openponic/features/auth/pages/login_screen.dart';
import 'package:app_openponic/features/auth/pages/signin_screen.dart';
import 'package:app_openponic/features/home/pages/initial_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routers = {
  '/': (context) => const SignInScreen(),
  '/login': (context) => const LoginScreen(),
  '/initial-screen': (context) => const InitialScreen(),
};
