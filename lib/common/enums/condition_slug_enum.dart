import 'package:app_openponic/common/icons/openponic_icons.dart';
import 'package:flutter/material.dart';

enum ConditionSlugEnum {
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
  erro,
}

extension ConditionSlugEnumExtension on ConditionSlugEnum {
  String get condition {
    switch (this) {
      case ConditionSlugEnum.storm:
        return 'Tempestade';
      case ConditionSlugEnum.snow:
        return 'Neve';
      case ConditionSlugEnum.hail:
        return 'Granizo';
      case ConditionSlugEnum.rain:
        return 'Chuva';
      case ConditionSlugEnum.fog:
        return 'Neblina';
      case ConditionSlugEnum.clearDay:
        return 'Dia Limpo';
      case ConditionSlugEnum.clearNight:
        return 'Noite Limpa';
      case ConditionSlugEnum.cloud:
        return 'Nublado';
      case ConditionSlugEnum.cloudlyDay:
        return 'Nublado de Dia';
      case ConditionSlugEnum.cloudlyNight:
        return 'Nublado de Noite';
      case ConditionSlugEnum.noneDay:
        return 'Erro - Dia';
      case ConditionSlugEnum.noneNight:
        return 'Erro - Noite';
      default:
        return 'Falha ao obter condição';
    }
  }

  IconData get icon {
    switch (this) {
      case ConditionSlugEnum.storm:
        return OpenponicIcons.clouds_flash_alt;
      case ConditionSlugEnum.snow:
        return OpenponicIcons.snow_heavy;
      case ConditionSlugEnum.hail:
        return OpenponicIcons.hail;
      case ConditionSlugEnum.rain:
        return OpenponicIcons.rain_1;
      case ConditionSlugEnum.fog:
        return OpenponicIcons.fog_cloud;
      case ConditionSlugEnum.clearDay:
        return OpenponicIcons.sun;
      case ConditionSlugEnum.clearNight:
        return OpenponicIcons.moon;
      case ConditionSlugEnum.cloud:
        return OpenponicIcons.cloud_1;
      case ConditionSlugEnum.cloudlyDay:
        return OpenponicIcons.cloud_sun_1;
      case ConditionSlugEnum.cloudlyNight:
        return OpenponicIcons.cloud_moon;
      case ConditionSlugEnum.noneDay:
        return OpenponicIcons.sun_2;
      case ConditionSlugEnum.noneNight:
        return OpenponicIcons.moon_1;
      default:
        return OpenponicIcons.na;
    }
  }

  String get conditionImage {
    switch (this) {
      case ConditionSlugEnum.storm:
        return 'assets/image/storm.png';
      case ConditionSlugEnum.snow:
        return 'assets/image/snow.png';
      case ConditionSlugEnum.hail:
        return 'assets/image/hail.png';
      case ConditionSlugEnum.rain:
        return 'assets/image/rain.png';
      case ConditionSlugEnum.fog:
        return 'assets/image/fog.png';
      case ConditionSlugEnum.clearDay:
        return 'assets/image/clear_day.png';
      case ConditionSlugEnum.clearNight:
        return 'assets/image/clear_night.png';
      case ConditionSlugEnum.cloud:
        return 'assets/image/cloud.png';
      case ConditionSlugEnum.cloudlyDay:
        return 'assets/image/cloudly_day.png';
      case ConditionSlugEnum.cloudlyNight:
        return 'assets/image/cloudly_night.png';
      case ConditionSlugEnum.noneDay:
        return 'assets/image/none_day.png';
      case ConditionSlugEnum.noneNight:
        return 'assets/image/none_night.png';
      default:
        return 'assets/image/error.png';
    }
  }
}
