enum ConditionSlug {
  storm,
  snow,
  hail,
  rain,
  fog,
  clearDay,
  clearNight,
  cloud,
  cloudlyDay,
  cloudlyNight,
  noneDay,
  noneNight,
}

extension ConditionSlugExtension on ConditionSlug {
  String get condition {
    switch (this) {
      case ConditionSlug.storm:
        return 'Tempestade';
      case ConditionSlug.snow:
        return 'Neve';
      case ConditionSlug.hail:
        return 'Granizo';
      case ConditionSlug.rain:
        return 'Chuva';
      case ConditionSlug.fog:
        return 'Neblina';
      case ConditionSlug.clearDay:
        return 'Dia Limpo';
      case ConditionSlug.clearNight:
        return 'Noite Limpa';
      case ConditionSlug.cloud:
        return 'Nublado';
      case ConditionSlug.cloudlyDay:
        return 'Nublado de Dia';
      case ConditionSlug.cloudlyNight:
        return 'Nublado de Noite';
      case ConditionSlug.noneDay:
        return 'Erro - Dia';
      case ConditionSlug.noneNight:
        return 'Erro - Noite';
      default:
        return 'Falha ao obter condição';
    }
  }
}
