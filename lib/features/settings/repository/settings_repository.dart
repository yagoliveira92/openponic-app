import 'package:app_openponic/features/settings/models/parameters_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ISettingsRepository {
  Future<void> updateParameters({required List<ParameterModel> parameters});
  Future<List<ParameterModel>> getAllParameters();
}

class SettingsRepository implements ISettingsRepository {
  @override
  Future<void> updateParameters(
      {required List<ParameterModel> parameters}) async {
    final prefs = await SharedPreferences.getInstance();
    Future.forEach<ParameterModel>(parameters, (element) {
      if (element.value != null) {
        prefs.setString(element.name ?? '', element.value.toString());
      }
    });
  }

  @override
  Future<List<ParameterModel>> getAllParameters() async {
    List<ParameterModel> listParameters = [];
    final prefs = await SharedPreferences.getInstance();
    listParameters = List<ParameterModel>.from([
      ParameterModel(
        name: 'ph',
        value: double.tryParse(prefs.getString('ph') ?? '5,5') ?? 5.5,
      ),
      ParameterModel(
        name: 'umidade',
        value: double.tryParse(prefs.getString('umidade') ?? '85.0') ?? 85.0,
      ),
      ParameterModel(
        name: 'condutividade',
        value: double.tryParse(prefs.getString('condutividade') ?? '725.0') ??
            725.0,
      ),
      ParameterModel(
        name: 'temperatura',
        value:
            double.tryParse(prefs.getString('temperatura') ?? '22.0') ?? 22.0,
      )
    ]);
    return listParameters;
  }
}

final settingsRepositoryProvider = Provider<ISettingsRepository>(
  (ref) => SettingsRepository(),
);
