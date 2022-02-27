import 'package:app_openponic/features/home/controller/bottom_bar/bottom_bar_controller.dart';
import 'package:app_openponic/features/home/controller/home/home_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerNotifierProvider = StateNotifierProvider(
  (ref) => HomeController(),
);

final bottomBarControllerProvider = StateNotifierProvider(
  (ref) => BottomBarController(),
);
