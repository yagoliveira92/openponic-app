class ForecastModel {
  ForecastModel({
    required this.date,
    this.weekday,
    this.max,
    this.min,
    this.description,
    this.condition,
  });

  String date;
  String? weekday;
  int? max;
  int? min;
  String? description;
  String? condition;

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
    return map;
  }
}
