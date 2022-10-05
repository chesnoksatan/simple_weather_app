import 'dart:convert';

import 'package:simple_weather_app/src/backend/constants.dart';
import 'package:simple_weather_app/src/backend/secret.dart';
import 'package:simple_weather_app/src/backend/services/weather_service_interface.dart';

import 'package:http/http.dart' as http;
import 'package:simple_weather_app/src/backend/weather.dart';

class OpenWeatherService extends IWeatherService {
  OpenWeatherService(Map<String, dynamic> json)
      : super(
          api: Api.fromJson(json),
          url: OpenWeatherStrings.url,
          path: OpenWeatherStrings.path,
        );

  @override
  Future<Weather> request(String city) async {
    final Uri uri = buildUri({"units": "metric", "q": city, "APPID": api.key});
    final http.Response response = await http.get(uri);

    if (response.statusCode != 200) {
      throw ResponseException(statusCode: response.statusCode);
    }

    return Weather.fromJson(city, jsonDecode(response.body));
  }
}
