import 'package:app_openponic/features/home/models/sensor_model.dart';
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
                      '${sensors[1].value} ',
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
                Container(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 3.0,
                    bottom: 3.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Bom',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
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
                      '${sensors[3].value}',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 3.0,
                    bottom: 3.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Bom',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
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
                      '${sensors[2].value} dS',
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
                Container(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 3.0,
                    bottom: 3.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Alerta',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black54,
                    ),
                  ),
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
                Container(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    right: 15.0,
                    top: 3.0,
                    bottom: 3.0,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Ruim',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
