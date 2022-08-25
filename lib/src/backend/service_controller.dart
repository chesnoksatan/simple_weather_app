import 'package:flutter/material.dart';
import 'package:simple_weather_app/src/backend/service_interface.dart';
import 'package:simple_weather_app/src/backend/weather.dart';

class ServiceController extends ChangeNotifier {
  final IWeatherService service;

  ServiceController({required this.service});

  Weather? currentWeather;
  bool inProgress = false;
  bool? isError;
  String? errorString;

  void requestWeather(String city) {
    currentWeather = null;
    errorString = null;
    isError = null;
    inProgress = true;
    notifyListeners();

    service.request(city).then((value) {
      currentWeather = value;
      print(currentWeather);
    }).catchError((e) {
      isError = true;
      errorString = e.toString();
      print(e);
    }).whenComplete(() {
      inProgress = false;
      notifyListeners();
    });
  }

  void clearData() {
    currentWeather = null;
    errorString = null;
    isError = null;
    inProgress = false;
    notifyListeners();
  }
}
