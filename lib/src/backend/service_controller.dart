import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:simple_weather_app/src/backend/constants.dart';
import 'package:simple_weather_app/src/backend/services/weather_service_interface.dart';
import 'package:simple_weather_app/src/backend/weather.dart';

/// Контроллер сервиса погоды
/// В конструктор передается любой потомок [IWeatherService], например [OpenWeatherService]
/// Способ передачи сервиса в конструкторе хороший метод для тестирования разных сервисов
/// например можно создать разные конфигурации запуска, чтобы разрабатывать на тэстовых данных
class ServiceController extends ChangeNotifier {
  final IWeatherService service;

  ServiceController({required this.service});

  Weather? currentWeather;
  bool hasInternet = true;
  bool inProgress = false;
  bool? isError;
  String? errorString;

  void requestWeather(String city) async {
    clearData();

    if (!(await InternetConnectionChecker().hasConnection)) {
      isError = true;
      errorString = ErrorStrings.noInternetConnection;
      notifyListeners();
      return;
    }

    inProgress = true;
    notifyListeners();

    try {
      currentWeather = await service.request(city);
    } on ResponseException catch (e) {
      isError = true;
      errorString = e.toString();
    } finally {
      inProgress = false;
      notifyListeners();
    }
  }

  void clearData() {
    currentWeather = null;
    errorString = null;
    isError = null;
    inProgress = false;
    notifyListeners();
  }

  // Еще один способ проверить соединение с сеть, чтобы не использовать внешние зависимости
  //   Future<bool> _checkUserConnection() async {
  //   try {
  //     final result = await InternetAddress.lookup('example.com');
  //     return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  //   } on SocketException catch (_) {
  //     return false;
  //   }
  // }
}
