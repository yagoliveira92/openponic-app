import 'package:app_openponic/features/home/controller/home/home_controller_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeController extends StateNotifier<HomeControllerState> {
  HomeController() : super(const HomeControllerInit());

  Future<void> clickButton() async {
    state = const HomeControllerLoading();
    await Future.delayed(
        const Duration(
          seconds: 5,
        ), () {
      state = const HomeControllerReady();
    });
  }
}
