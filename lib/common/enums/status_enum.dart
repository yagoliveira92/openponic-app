import 'package:app_openponic/common/colors/openponic_color.dart';
import 'package:flutter/material.dart';

enum StatusEnum { bom, alerta, ruim, erro }

extension StatusEnumExtension on StatusEnum {
  String get condition {
    switch (this) {
      case StatusEnum.bom:
        return 'Bom';
      case StatusEnum.alerta:
        return 'Alerta';
      case StatusEnum.ruim:
        return 'Ruim';
      default:
        return 'Erro';
    }
  }

  Color get color {
    switch (this) {
      case StatusEnum.bom:
        return OpenponicColor.green;
      case StatusEnum.alerta:
        return OpenponicColor.yellow;
      case StatusEnum.ruim:
      case StatusEnum.erro:
        return Colors.red;
    }
  }
}
