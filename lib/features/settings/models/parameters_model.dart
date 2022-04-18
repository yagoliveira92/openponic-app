class ParameterModel {
  ParameterModel({
    required this.name,
    required this.value,
  });
  String? name;
  double? value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParameterModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          value == other.value);

  @override
  int get hashCode => name.hashCode ^ value.hashCode;

  @override
  String toString() {
    return 'ParameterModel{name: $name, value: $value}';
  }

  ParameterModel copyWith({
    String? name,
    double? value,
  }) {
    return ParameterModel(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory ParameterModel.fromMap(Map<String, dynamic> map) {
    return ParameterModel(
      name: map['name'] as String,
      value: map['value'] as double,
    );
  }
}
