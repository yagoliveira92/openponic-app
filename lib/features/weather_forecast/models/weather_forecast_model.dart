import 'package:app_openponic/common/enums/condition_slug_enum.dart';
import 'package:app_openponic/features/weather_forecast/models/forecast_model.dart';

class WeatherForecastModel {
  WeatherForecastModel({
    this.temp,
    this.date,
    this.time,
    this.conditionCode,
    this.description,
    this.currently,
    this.cid,
    this.city,
    this.imgId,
    this.humidity,
    this.windSpeedy,
    this.sunrise,
    this.sunset,
    this.condition,
    this.cityName,
    this.conditionSlugEnum,
    required this.forecastModel,
  });

  int? temp;
  String? date;
  String? time;
  String? conditionCode;
  String? description;
  String? currently;
  String? cid;
  String? city;
  String? imgId;
  int? humidity;
  String? windSpeedy;
  String? sunrise;
  String? sunset;
  String? condition;
  String? cityName;
  ConditionSlugEnum? conditionSlugEnum;
  List<ForecastModel> forecastModel;

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    return WeatherForecastModel(
      forecastModel: List<ForecastModel>.from(
        json['forecast'].map(
          (map) => ForecastModel.fromJson(map),
        ),
      ),
      description: json['description'],
      temp: json['temp'],
      date: json['date'],
      time: json['time'],
      conditionCode: json['condition_code'],
      currently: json['currently'],
      cid: json['cid'],
      city: json['city'],
      imgId: json['img_id'],
      humidity: json['humidity'],
      windSpeedy: json['wind_speedy'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      condition: json['condition_slug'],
      cityName: json['city_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = temp;
    map['date'] = date;
    map['time'] = time;
    map['condition_code'] = conditionCode;
    map['description'] = description;
    map['currently'] = currently;
    map['cid'] = cid;
    map['city'] = city;
    map['img_id'] = imgId;
    map['humidity'] = humidity;
    map['wind_speedy'] = windSpeedy;
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['condition_slug'] = condition;
    map['city_name'] = cityName;
    map['forecast'] = forecastModel.map((v) => v.toJson()).toList();
    return map;
  }

  WeatherForecastModel copyWith({
    int? temp,
    String? date,
    String? time,
    String? conditionCode,
    String? description,
    String? currently,
    String? cid,
    String? city,
    String? imgId,
    int? humidity,
    String? windSpeedy,
    ConditionSlugEnum? conditionSlugEnum,
    String? sunrise,
    String? sunset,
    String? condition,
    String? cityName,
    List<ForecastModel>? forecastModel,
  }) {
    return WeatherForecastModel(
      temp: temp ?? this.temp,
      date: date ?? this.date,
      time: time ?? this.time,
      conditionCode: conditionCode ?? this.conditionCode,
      description: description ?? this.description,
      currently: currently ?? this.currently,
      cid: cid ?? this.cid,
      city: city ?? this.city,
      imgId: imgId ?? this.imgId,
      humidity: humidity ?? this.humidity,
      windSpeedy: windSpeedy ?? this.windSpeedy,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      condition: condition ?? this.condition,
      cityName: cityName ?? this.cityName,
      forecastModel: forecastModel ?? this.forecastModel,
      conditionSlugEnum: conditionSlugEnum ?? this.conditionSlugEnum,
    );
  }
}
