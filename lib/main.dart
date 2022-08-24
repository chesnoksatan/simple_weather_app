import 'package:flutter/material.dart' show runApp, WidgetsFlutterBinding;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert' show json;

import 'package:simple_weather_app/src/backend/open_weather_service.dart';
import 'package:simple_weather_app/src/backend/service_controller.dart';
import 'package:simple_weather_app/weather.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final keys = await rootBundle.loadString('keys.json');
  runApp(
    WeatherApp(
      controller: ServiceController(
        service: OpenWeatherService(json.decode(keys)),
      ),
    ),
  );
}
