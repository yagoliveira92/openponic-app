import 'package:app_openponic/features/home/controller/home_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerNotifierProvider = StateNotifierProvider(
  (ref) => HomeController(),
);
