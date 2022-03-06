import 'package:app_openponic/features/weather_forecast/controller/weather_forecast_controller.dart';
import 'package:app_openponic/features/weather_forecast/controller/weather_forecast_state.dart';
import 'package:app_openponic/features/weather_forecast/widgets/card_weather_forecast_widget.dart';
import 'package:app_openponic/features/weather_forecast/widgets/header_forecast_weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherForecastScreen extends ConsumerStatefulWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends ConsumerState<WeatherForecastScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) => ref.read(weatherForecastController.notifier).getWeatherForecast(),
    );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final state = ref.watch(weatherForecastController);
    if (state is WeatherForecastReady) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        body: CustomScrollView(
          physics: const ScrollPhysics(),
          slivers: [
            HeaderForecastWeatherWidget(
                weatherForecastModel: state.weatherForecastModel),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 15.0,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CardWeatherForecastWidget(
                    forecast: state.weatherForecastModel.forecastModel[index],
                  );
                },
                childCount: state.weatherForecastModel.forecastModel.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12.0,
              ),
            )
          ],
        ),
      );
    }
    if (state is WeatherForecastError) {
      return Scaffold(
        backgroundColor: Colors.grey[100],
        body: Center(
          child: Text(
            state.message,
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const Center(
        child: SizedBox.square(
          dimension: 50.0,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
