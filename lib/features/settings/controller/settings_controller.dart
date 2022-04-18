import 'package:app_openponic/features/settings/controller/settings_controller_state.dart';
import 'package:app_openponic/features/settings/models/parameters_model.dart';
import 'package:app_openponic/features/settings/repository/settings_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsController extends StateNotifier<SettingsControllerState> {
  SettingsController({required this.settingsRepository})
      : super(const SettingsControllerInit()) {
    fetchAllParameters();
  }

  final ISettingsRepository settingsRepository;

  void fetchAllParameters({bool isUpdate = false}) async {
    final allParameters = await settingsRepository.getAllParameters();
    state = SettingsControllerSuccess(
      allParameters: allParameters,
      isUpdateParameter: isUpdate,
    );
  }

  Future<void> updateParameters({
    required String ph,
    required String umidade,
    required String temperatura,
    required String condutividade,
  }) async {
    final list = <ParameterModel>[];
    if (ph.isNotEmpty) {
      list.add(
        ParameterModel(
          name: 'ph',
          value: double.parse(ph),
        ),
      );
    }
    if (umidade.isNotEmpty) {
      list.add(
        ParameterModel(
          name: 'umidade',
          value: double.parse(umidade),
        ),
      );
    }
    if (temperatura.isNotEmpty) {
      list.add(
        ParameterModel(
          name: 'temperatura',
          value: double.parse(temperatura),
        ),
      );
    }
    if (condutividade.isNotEmpty) {
      list.add(
        ParameterModel(
          name: 'condutividade',
          value: double.parse(condutividade),
        ),
      );
    }
    await settingsRepository.updateParameters(parameters: list);

    fetchAllParameters(isUpdate: true);
  }
}

final settingsController =
    StateNotifierProvider<SettingsController, SettingsControllerState>(
  (ref) => SettingsController(
    settingsRepository: ref.watch(
      settingsRepositoryProvider,
    ),
  ),
);
