import 'dart:async';
import 'dart:convert';

import 'package:app_openponic/common/enums/status_enum.dart';
import 'package:app_openponic/features/home/models/flowerbad_model.dart';
import 'package:app_openponic/features/home/models/sensor_model.dart';
import 'package:app_openponic/features/settings/repository/settings_repository.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IHomeRepository {
  Stream<List<FlowerbadModel>> getAllFlowerbads();
  Future<List<SensorModel>> getStatus(FlowerbadModel flowerbadModel);
}

class HomeRepository implements IHomeRepository {
  const HomeRepository({required this.settingsRepository});
  final ISettingsRepository settingsRepository;
  @override
  Stream<List<FlowerbadModel>> getAllFlowerbads() {
    DatabaseReference allPlat = FirebaseDatabase.instance.ref();
    final dataFinal = allPlat.onValue.map((event) {
      final stream = event.snapshot.value as List;
      final data = List<FlowerbadModel>.from(
        stream
            .map(
              (e) => FlowerbadModel.fromMap(
                jsonDecode(
                  jsonEncode(e),
                ),
              ),
            )
            .toList(),
      );

      return data;
    });
    return dataFinal;
  }

  @override
  Future<List<SensorModel>> getStatus(
    FlowerbadModel flowerbadModel,
  ) async {
    List<SensorModel> newSensors = [];
    final allParameters = await settingsRepository.getAllParameters();
    for (final element in flowerbadModel.sensors) {
      final getParameter = allParameters
          .firstWhere((parameter) => parameter.name == element.nome);
      if (element.value <=
          (getParameter.value! + (getParameter.value! * 0.10))) {
        newSensors.add(
          element.copyWith(status: StatusEnum.bom),
        );
      } else {
        if (element.value >
            (getParameter.value! + (getParameter.value! * 0.10))) {
          if (element.value >=
              (getParameter.value! + (getParameter.value! * 0.15))) {
            newSensors.add(
              element.copyWith(status: StatusEnum.ruim),
            );
          }
        } else {
          newSensors.add(
            element.copyWith(status: StatusEnum.alerta),
          );
        }
      }
    }
    return newSensors;
  }
}

final homeRepositoryProvider = Provider<IHomeRepository>(
  (ref) => HomeRepository(
    settingsRepository: ref.watch(settingsRepositoryProvider),
  ),
);
