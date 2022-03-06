import 'package:app_openponic/common/icons/openponic_icons.dart';
import 'package:app_openponic/features/weather_forecast/models/weather_forecast_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderForecastWeatherWidget extends StatelessWidget {
  const HeaderForecastWeatherWidget(
      {required this.weatherForecastModel, Key? key})
      : super(key: key);

  final WeatherForecastModel weatherForecastModel;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 280.0,
        decoration: const BoxDecoration(
          color: Color(0xFF4db6e3),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35.0),
            bottomRight: Radius.circular(35.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20.0),
            Text(
              '${weatherForecastModel.city}',
              style: const TextStyle(
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
                          '${weatherForecastModel.temp}º',
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
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
                      '${weatherForecastModel.windSpeedy}',
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
                      '${weatherForecastModel.humidity}%',
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
                      '${weatherForecastModel.sunrise}',
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
    );
  }
}
