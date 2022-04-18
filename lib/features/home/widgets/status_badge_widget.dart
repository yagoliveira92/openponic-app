import 'package:app_openponic/common/colors/openponic_color.dart';
import 'package:app_openponic/common/enums/status_enum.dart';
import 'package:flutter/material.dart';

class StatusBadgeWidget extends StatelessWidget {
  const StatusBadgeWidget({required this.status, Key? key}) : super(key: key);
  final StatusEnum status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 3.0,
        bottom: 3.0,
      ),
      decoration: BoxDecoration(
        color: status.color,
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Text(
        status.condition,
        style: TextStyle(
          fontSize: 17,
          color: status.condition == 'Alerta'
              ? OpenponicColor.yellow
              : Colors.white,
        ),
      ),
    );
  }
}
