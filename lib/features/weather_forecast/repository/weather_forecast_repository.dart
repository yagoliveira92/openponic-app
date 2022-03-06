import 'dart:convert';

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
    var url = Uri.parse(
      'https://api.hgbrasil.com/weather?key=e62cb5cd&woeid=455839',
    );
    var response = await http.get(url);
    if (response.statusCode < 400) {
      return WeatherForecastModel.fromJson(
          jsonDecode(response.body)['results']);
    } else {
      throw NetworkException();
    }
  }
}

final weatherRepositoryProvider = Provider<IWeatherRepository>(
  (ref) => WeatherRepository(),
);
