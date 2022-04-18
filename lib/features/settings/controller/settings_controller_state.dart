import 'package:app_openponic/features/settings/models/parameters_model.dart';

abstract class SettingsControllerState {
  const SettingsControllerState();
}

class SettingsControllerInit extends SettingsControllerState {
  const SettingsControllerInit();
}

class SettingsControllerSuccess extends SettingsControllerState {
  const SettingsControllerSuccess({
    required this.allParameters,
    required this.isUpdateParameter,
  });

  final List<ParameterModel> allParameters;
  final bool isUpdateParameter;
}
