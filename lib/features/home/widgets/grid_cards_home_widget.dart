import 'package:app_openponic/common/enums/status_enum.dart';
import 'package:app_openponic/features/home/models/sensor_model.dart';
import 'package:app_openponic/features/home/widgets/status_badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridCardsHomeWidget extends StatelessWidget {
  const GridCardsHomeWidget({required this.sensors, Key? key})
      : super(key: key);
  final List<SensorModel> sensors;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(20.0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 1.15,
      crossAxisCount: 2,
      children: <Widget>[
        Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Text(
                  'Temperatura',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      'assets/image/temperature.png',
                      height: 70.0,
                    ),
                    Text(
                      '${sensors[1].value} ºC ',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                StatusBadgeWidget(
                  status: sensors[1].status ?? StatusEnum.erro,
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Text(
                  'Umidade',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      'assets/image/humidity.png',
                      height: 70.0,
                    ),
                    Text(
                      '${sensors[2].value}',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                StatusBadgeWidget(
                  status: sensors[2].status ?? StatusEnum.erro,
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Text(
                  'Condutividade',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      'assets/image/condutivity.png',
                      height: 60.0,
                    ),
                    Text(
                      '${sensors[3].value} dS',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                StatusBadgeWidget(
                  status: sensors[3].status ?? StatusEnum.erro,
                )
              ],
            ),
          ),
        ),
        Card(
          elevation: 5,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Text(
                  'pH',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      'assets/image/ph.png',
                      height: 60.0,
                    ),
                    Text(
                      '${sensors[0].value} pKa',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                StatusBadgeWidget(
                  status: sensors[0].status ?? StatusEnum.erro,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
