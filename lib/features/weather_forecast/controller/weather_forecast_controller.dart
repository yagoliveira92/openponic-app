import 'package:app_openponic/features/weather_forecast/controller/weather_forecast_state.dart';
import 'package:app_openponic/features/weather_forecast/repository/weather_forecast_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherForecastController extends StateNotifier<WeatherForecastState> {
  final IWeatherRepository weatherRepository;

  WeatherForecastController({required this.weatherRepository})
      : super(const WeatherForecastInit());

  Future<void> getWeatherForecast() async {
    try {
      final weather = await weatherRepository.getWeather();
      state = WeatherForecastReady(weatherForecastModel: weather);
    } on NetworkException {
      state = const WeatherForecastError(
        message:
            'Não foi possível obter a previsão. Tente novamente mais tarde',
      );
    }
  }
}

final weatherForecastController =
    StateNotifierProvider<WeatherForecastController, WeatherForecastState>(
  (ref) => WeatherForecastController(
    weatherRepository: ref.watch(
      weatherRepositoryProvider,
    ),
  ),
);
