import 'package:app_openponic/common/enums/condition_slug_enum.dart';

class ForecastModel {
  ForecastModel({
    required this.date,
    this.weekday,
    this.max,
    this.min,
    this.description,
    required this.condition,
    this.conditionSlug,
  });

  String date;
  String? weekday;
  int? max;
  int? min;
  String? description;
  String condition;
  ConditionSlugEnum? conditionSlug;

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: json['date'],
      weekday: json['weekday'],
      max: json['max'],
      min: json['min'],
      description: json['description'],
      condition: json['condition'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['weekday'] = weekday;
    map['max'] = max;
    map['min'] = min;
    map['description'] = description;
    map['condition'] = condition;
    map['condition_slug'] = conditionSlug?.condition;
    return map;
  }

  ForecastModel copyWith({
    String? date,
    String? weekday,
    int? max,
    int? min,
    String? description,
    String? condition,
    ConditionSlugEnum? conditionSlug,
  }) {
    return ForecastModel(
      date: date ?? this.date,
      weekday: weekday ?? this.weekday,
      max: max ?? this.max,
      min: min ?? this.min,
      description: description ?? this.description,
      condition: condition ?? this.condition,
      conditionSlug: conditionSlug ?? this.conditionSlug,
    );
  }
}
