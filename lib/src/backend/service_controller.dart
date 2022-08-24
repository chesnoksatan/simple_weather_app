import 'package:flutter/material.dart';
import 'package:simple_weather_app/src/backend/service_interface.dart';

class ServiceController extends ChangeNotifier {
  final IWeatherService service;

  ServiceController({required this.service});
}
