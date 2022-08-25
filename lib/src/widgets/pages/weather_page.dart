import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  static const String url = "/weather";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Provider.of<ServiceController>(context).currentWeather.toString(),
        ),
        ElevatedButton(
          onPressed:
              Provider.of<ServiceController>(context, listen: false).clearData,
          child: const Text("Поиск"),
        ),
      ],
    );
  }
}
