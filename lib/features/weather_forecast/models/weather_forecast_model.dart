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
    this.conditionSlug,
    this.cityName,
    this.forecast,
  });

  WeatherForecastModel.fromJson(dynamic json) {
    temp = json['temp'];
    date = json['date'];
    time = json['time'];
    conditionCode = json['condition_code'];
    description = json['description'];
    currently = json['currently'];
    cid = json['cid'];
    city = json['city'];
    imgId = json['img_id'];
    humidity = json['humidity'];
    windSpeedy = json['wind_speedy'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    conditionSlug = json['condition_slug'];
    cityName = json['city_name'];
    if (json['forecast'] != null) {
      forecast = [];
      json['forecast'].forEach((v) {
        forecast?.add(Forecast.fromJson(v));
      });
    }
  }
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
  String? conditionSlug;
  String? cityName;
  List<Forecast>? forecast;

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
    map['condition_slug'] = conditionSlug;
    map['city_name'] = cityName;
    if (forecast != null) {
      map['forecast'] = forecast?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
