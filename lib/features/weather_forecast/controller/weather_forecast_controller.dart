import 'package:app_openponic/features/weather_forecast/controller/weather_forecast_state.dart';
import 'package:app_openponic/features/weather_forecast/models/weather_forecast_model.dart';
import 'package:app_openponic/features/weather_forecast/repository/weather_forecast_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherForecastController extends StateNotifier<WeatherForecastState> {
  final IWeatherRepository weatherRepository;

  WeatherForecastController({required this.weatherRepository})
      : super(const WeatherForecastInit());

  Future<WeatherForecastModel> getWeatherForecast() async {
    return await weatherRepository.getWeather();
  }
}

final weatherForecastController = StateNotifierProvider(
  (ref) => WeatherForecastController(
    weatherRepository: ref.watch(
      weatherRepositoryProvider,
    ),
  ),
);
