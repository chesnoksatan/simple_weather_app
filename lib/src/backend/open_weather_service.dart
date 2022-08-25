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
    final Uri uri = buildUri({"units": "metric", "q": city, "APPID": api.key});
    final http.Response response = await http.get(uri);
    final body = jsonDecode(response.body);

    if (response.statusCode != 200) {
      throw ResponseException(statusCode: response.statusCode);
    }

    return Weather.fromJson(city, body);
  }
}
