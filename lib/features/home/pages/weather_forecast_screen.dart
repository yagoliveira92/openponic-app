import 'package:app_openponic/common/icons/openponic_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class WeatherForecastScreen extends StatelessWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 280.0,
              decoration: const BoxDecoration(
                color: Color(0xFF4db6e3),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  const Text(
                    'Aracaju / SE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    'Hoje',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/sun_img.png',
                        height: 130.0,
                      ),
                      Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '32',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontSize: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                '/ 17º',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                    fontSize: 35,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Céu claro',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    height: 15.0,
                    color: Colors.white70,
                    indent: 10.0,
                    endIndent: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Icon(
                            OpenponicIcons.windy,
                          ),
                          Text(
                            '13 km/h',
                            style: GoogleFonts.montserrat(),
                          ),
                          const Text('Vento'),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            Icons.water_drop_outlined,
                          ),
                          Text(
                            '24%',
                            style: GoogleFonts.montserrat(),
                          ),
                          const Text('Humidade'),
                        ],
                      ),
                      Column(
                        children: [
                          const Icon(
                            OpenponicIcons.sunrise,
                          ),
                          Text(
                            '5:00',
                            style: GoogleFonts.montserrat(),
                          ),
                          const Text('Nascer\ndo Sol'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            ListView(
              padding: const EdgeInsets.only(
                top: 5.0,
                bottom: 5.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Card(
                  elevation: 2,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(OpenponicIcons.cloud_sun),
                        const Text(
                          'Segunda-Feira',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            style: GoogleFonts.montserrat(),
                            children: const [
                              TextSpan(
                                text: '22',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' - 17º'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Card(
                  elevation: 2,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(OpenponicIcons.clouds),
                        const Text(
                          'Terça-Feira',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            style: GoogleFonts.montserrat(),
                            children: const [
                              TextSpan(
                                text: '22',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' - 17º'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Card(
                  elevation: 2,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(OpenponicIcons.rain),
                        const Text(
                          'Quarta-Feira',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            style: GoogleFonts.montserrat(),
                            children: const [
                              TextSpan(
                                text: '22',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' - 17º'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Card(
                  elevation: 2,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(OpenponicIcons.rain),
                        const Text(
                          'Quinta-Feira',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            style: GoogleFonts.montserrat(),
                            children: const [
                              TextSpan(
                                text: '22',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' - 17º'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Card(
                  elevation: 2,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(OpenponicIcons.rain),
                        const Text(
                          'Sexta-Feira',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            style: GoogleFonts.montserrat(),
                            children: const [
                              TextSpan(
                                text: '22',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' - 17º'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Card(
                  elevation: 2,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(OpenponicIcons.cloud_sun),
                        const Text(
                          'Sábado',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            style: GoogleFonts.montserrat(),
                            children: const [
                              TextSpan(
                                text: '22',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' - 17º'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Card(
                  elevation: 2,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(OpenponicIcons.sun),
                        const Text(
                          'Domingo',
                          style: TextStyle(
                            fontSize: 17.0,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            style: GoogleFonts.montserrat(),
                            children: const [
                              TextSpan(
                                text: '22',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(text: ' - 17º'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
