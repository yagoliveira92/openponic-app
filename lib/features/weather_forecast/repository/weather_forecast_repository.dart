import 'dart:convert';

import 'package:app_openponic/common/enums/condition_slug_enum.dart';
import 'package:app_openponic/features/weather_forecast/models/forecast_model.dart';
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
      final weather =
          WeatherForecastModel.fromJson(jsonDecode(response.body)['results']);
      List<ForecastModel> forecastWithCondition = [];
      await Future.forEach<ForecastModel>(
        weather.forecastModel,
        (element) => forecastWithCondition.add(
          element.copyWith(
            conditionSlug: getCondition(
              condition: element.condition,
            ),
          ),
        ),
      );
      final weatherWithCondition = weather.copyWith(
        conditionSlugEnum: getCondition(
          condition: weather.condition ?? '',
        ),
        forecastModel: forecastWithCondition,
      );
      return weatherWithCondition;
    } else {
      throw NetworkException();
    }
  }

  ConditionSlugEnum getCondition({required String condition}) {
    switch (condition) {
      case 'storm':
        return ConditionSlugEnum.storm;
      case 'snow':
        return ConditionSlugEnum.snow;
      case 'hail':
        return ConditionSlugEnum.hail;
      case 'rain':
        return ConditionSlugEnum.rain;
      case 'fog':
        return ConditionSlugEnum.fog;
      case 'clear_day':
        return ConditionSlugEnum.clearDay;
      case 'clear_night':
        return ConditionSlugEnum.clearNight;
      case 'cloud':
        return ConditionSlugEnum.cloud;
      case 'cloudly_day':
        return ConditionSlugEnum.cloudlyDay;
      case 'cloudly_night':
        return ConditionSlugEnum.cloudlyNight;
      case 'none_day':
        return ConditionSlugEnum.noneDay;
      case 'none_night':
        return ConditionSlugEnum.noneNight;
      default:
        return ConditionSlugEnum.erro;
    }
  }
}

final weatherRepositoryProvider = Provider<IWeatherRepository>(
  (ref) => WeatherRepository(),
);
