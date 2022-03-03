class Forecast {
  Forecast({
    this.date,
    this.weekday,
    this.max,
    this.min,
    this.description,
    this.condition,
  });

  Forecast.fromJson(dynamic json) {
    date = json['date'];
    weekday = json['weekday'];
    max = json['max'];
    min = json['min'];
    description = json['description'];
    condition = json['condition'];
  }
  String? date;
  String? weekday;
  int? max;
  int? min;
  String? description;
  String? condition;

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
