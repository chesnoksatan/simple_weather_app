import 'package:flutter/material.dart';
import 'package:simple_weather_app/src/backend/secret.dart';
import 'package:simple_weather_app/src/backend/weather.dart';

abstract class IWeatherService {
  @protected
  final Api api;

  @protected
  final String url;

  @protected
  final String path;

  Uri buildUri([Map<String, dynamic>? parameters]) =>
      Uri.https(url, path, parameters);

  Future<Weather> request(String city);

  const IWeatherService({
    required this.api,
    required this.url,
    required this.path,
  });
}

class ResponseException implements Exception {
  final int statusCode;

  const ResponseException({required this.statusCode});

  @override
  String toString() {
    switch (statusCode) {
      case 404:
        return "Город с таким названием не найден";
      case 401:
        return "Не валидный публичный ключ";
      case 400:
        return "Невозможно отправить пустой запрос";
      default:
        return "Неизвестная ошибка";
    }
  }
}
