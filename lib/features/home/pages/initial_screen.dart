import 'package:app_openponic/features/home/controller/bottom_bar/bottom_bar_controller.dart';
import 'package:app_openponic/features/home/pages/home_page_screen.dart';
import 'package:app_openponic/features/home/pages/info_screen.dart';
import 'package:app_openponic/features/home/widgets/bottom_bar_widget.dart';
import 'package:app_openponic/features/weather_forecast/pages/weather_forecast_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController _controller = PageController(initialPage: 1);
    final int menuIndex = ref.watch(bottomBarControllerProvider) as int;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        bottomNavigationBar: BottomBarWidget(
          currentIndex: menuIndex,
          changeIndex: (index) {
            ref.read(bottomBarControllerProvider.notifier).value = index;
            _controller.animateToPage(index,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut);
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (index) =>
              ref.read(bottomBarControllerProvider.notifier).value = index,
          children: const <Widget>[
            WeatherForecastScreen(),
            HomePageScreen(),
            InfoScreen(),
          ],
        ),
      ),
    );
  }
}
