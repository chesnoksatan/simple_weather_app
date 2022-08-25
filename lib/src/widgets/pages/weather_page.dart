import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';
import 'package:simple_weather_app/src/widgets/pages/search_page.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({Key? key}) : super(key: key);

  static const String url = "/weather";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Provider.of<ServiceController>(context).currentWeather.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, SearchPage.url);
              },
              child: const Text("Поиск"),
            ),
          ],
        ),
      ),
    );
  }
}
