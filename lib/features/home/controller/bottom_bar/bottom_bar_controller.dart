import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBarController extends StateNotifier<int> {
  BottomBarController() : super(1);

  set value(int index) => state = index;
}

final bottomBarControllerProvider = StateNotifierProvider(
  (ref) => BottomBarController(),
);
