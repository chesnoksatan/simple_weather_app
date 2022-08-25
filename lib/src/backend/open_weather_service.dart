import 'dart:convert';

import 'package:simple_weather_app/src/backend/secret.dart';
import 'package:simple_weather_app/src/backend/service_interface.dart';

import 'package:http/http.dart' as http;
import 'package:simple_weather_app/src/backend/weather.dart';

class OpenWeatherService extends IWeatherService {
  OpenWeatherService(Map<String, dynamic> json)
      : super(
          api: Api.fromJson(json),
          url: "api.openweathermap.org",
          path: "/data/2.5/weather",
        );

  @override
  Future<Weather> request(String city) async {
    var uri = buildUri({"q": city, "APPID": api.key});
    var response = await http.get(uri);
    await Future.delayed(const Duration(milliseconds: 2000));
    return Weather.fromJson(city, jsonDecode(response.body));
  }
}
