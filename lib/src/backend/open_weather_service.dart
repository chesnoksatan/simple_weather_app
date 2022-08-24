import 'package:simple_weather_app/src/backend/secret.dart';
import 'package:simple_weather_app/src/backend/service_interface.dart';

// import 'dart:convert' show json;
// import 'package:flutter/services.dart' show rootBundle;

class OpenWeatherService extends IWeatherService {
  OpenWeatherService(Map<String, dynamic> json)
      : super(
          api: Api.fromJson(json),
          url: "https://api.openweathermap.org/data/2.5/weather",
        );

  @override
  Future<void> request(String city) {
    return Future(() {});
  }
}
