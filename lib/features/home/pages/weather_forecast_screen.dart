import 'package:flutter/material.dart';

class WeatherForecastScreen extends StatelessWidget {
  const WeatherForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão do Tempo'),
      ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}
