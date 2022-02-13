import 'package:app_openponic/common/openponic_color.dart';
import 'package:app_openponic/features/home/presentation/pages/home_page_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenPonic Project',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: OpenponicColor.green,
        fontFamily: 'AntipastoPro',
        backgroundColor: Colors.white,
      ),
      home: const HomePageScreen(),
    );
  }
}
