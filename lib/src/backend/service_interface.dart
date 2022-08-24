import 'package:flutter/material.dart';
import 'package:simple_weather_app/src/backend/secret.dart';

abstract class IWeatherService {
  @protected
  final Api api;

  @protected
  final String url;

  Future<void> request(String city);

  const IWeatherService({
    required this.api,
    required this.url,
  });
}
