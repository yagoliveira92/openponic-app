import 'package:app_openponic/features/weather_forecast/models/weather_forecast_model.dart';

abstract class WeatherForecastState {
  const WeatherForecastState();
}

class WeatherForecastInit extends WeatherForecastState {
  const WeatherForecastInit();
}

class WeatherForecastLoading extends WeatherForecastState {
  const WeatherForecastLoading();
}

class WeatherForecastError extends WeatherForecastState {
  const WeatherForecastError({
    required this.message,
  });

  final String message;
}

class WeatherForecastReady extends WeatherForecastState {
  const WeatherForecastReady({
    required this.weatherForecastModel,
  });

  final WeatherForecastModel weatherForecastModel;
}
