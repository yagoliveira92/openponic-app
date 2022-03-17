import 'package:app_openponic/features/home/models/sensor_model.dart';

class FlowerbadModel {
  String nome;
  List<SensorModel> sensors;

  FlowerbadModel({
    required this.nome,
    required this.sensors,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FlowerbadModel &&
          runtimeType == other.runtimeType &&
          nome == other.nome &&
          sensors == other.sensors);

  @override
  int get hashCode => nome.hashCode ^ sensors.hashCode;

  @override
  String toString() {
    return 'FlowerbadModel{' ' nome: $nome,' ' sensors: $sensors,' '}';
  }

  FlowerbadModel copyWith({
    String? nome,
    List<SensorModel>? sensors,
  }) {
    return FlowerbadModel(
      nome: nome ?? this.nome,
      sensors: sensors ?? this.sensors,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'data': sensors,
    };
  }

  factory FlowerbadModel.fromMap(Map<String, dynamic> map) {
    return FlowerbadModel(
      nome: map['nome'] as String,
      sensors: List<SensorModel>.from(
        map['data'].map(
          (map) => SensorModel.fromMap(map),
        ),
      ),
    );
  }
}
