import 'package:app_openponic/common/enums/condition_slug_enum.dart';
import 'package:app_openponic/features/weather_forecast/models/forecast_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardWeatherForecastWidget extends StatelessWidget {
  const CardWeatherForecastWidget({required this.forecast, Key? key})
      : super(key: key);
  final ForecastModel forecast;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              forecast.conditionSlug?.icon,
              color: Colors.blueGrey,
            ),
            Text(
              '${forecast.date} - ${forecast.weekday}',
              style: GoogleFonts.montserrat(
                fontSize: 15.0,
              ),
            ),
            Text.rich(
              TextSpan(
                style: GoogleFonts.montserrat(),
                children: [
                  TextSpan(
                    text: '${forecast.max}º',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' - ${forecast.min}º',
                    style: const TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
