import 'package:app_openponic/common/enums/status_enum.dart';

class SensorModel {
  String nome;
  StatusEnum? status;
  double value;

  SensorModel({
    required this.nome,
    this.status,
    required this.value,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SensorModel &&
          runtimeType == other.runtimeType &&
          nome == other.nome &&
          status == other.status &&
          value == other.value);

  @override
  int get hashCode => nome.hashCode ^ status.hashCode ^ value.hashCode;

  @override
  String toString() {
    return 'SensorModel{'
        ' nome: $nome,'
        ' status: $status,'
        ' value: $value,'
        '}';
  }

  SensorModel copyWith({
    String? nome,
    StatusEnum? status,
    double? value,
  }) {
    return SensorModel(
      nome: nome ?? this.nome,
      status: status ?? this.status,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'status': status,
      'value': value,
    };
  }

  factory SensorModel.fromMap(Map<String, dynamic> map) {
    return SensorModel(
      nome: map['nome'] as String,
      value: map['value'] as double,
    );
  }
}
