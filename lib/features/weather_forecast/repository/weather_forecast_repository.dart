import 'package:app_openponic/features/weather_forecast/models/weather_forecast_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

abstract class IWeatherRepository {
  Future<WeatherForecastModel> getWeather();
}

class NetworkException implements Exception {}

class WeatherRepository implements IWeatherRepository {
  @override
  Future<WeatherForecastModel> getWeather() async {
    var url = Uri.parse('https://example.com/whatsit/create');
    var response = await http.post(url);
    if (response.statusCode < 400) {
      return WeatherForecastModel.fromJson(response.body);
    } else {
      throw NetworkException();
    }
  }
}

final weatherRepositoryProvider = Provider<IWeatherRepository>(
  (ref) => WeatherRepository(),
);
