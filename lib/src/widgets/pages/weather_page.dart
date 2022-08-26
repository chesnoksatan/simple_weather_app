import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';
import 'package:simple_weather_app/src/backend/weather.dart';

class WeatherPage extends StatelessWidget {
  final Weather weather;

  const WeatherPage(
    this.weather, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          weather.city,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          "${weather.currentTemperature} C",
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        const Text(
          "Температура",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "${weather.minTemperature} C",
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const Text(
                  "Мин",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "${weather.maxTemperature} C",
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const Text(
                  "Макс",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            )
          ],
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
          ),
          onPressed:
              Provider.of<ServiceController>(context, listen: false).clearData,
          child: const Text("Поиск"),
        ),
      ],
    );
  }
}
