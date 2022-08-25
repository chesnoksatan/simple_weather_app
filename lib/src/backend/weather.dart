class Weather {
  final String city;
  final double _currentTemperature;
  final double _minTemperature;
  final double _maxTemperature;

  const Weather({
    required this.city,
    required double currentTemperature,
    required double minTemperature,
    required double maxTemperature,
  })  : _currentTemperature = currentTemperature,
        _minTemperature = minTemperature,
        _maxTemperature = maxTemperature;

  factory Weather.fromJson(String city, Map<String, dynamic> json) => Weather(
        city: city,
        currentTemperature: json["main"]["temp"] as double,
        minTemperature: json["main"]["temp_min"] as double,
        maxTemperature: json["main"]["temp_max"] as double,
      );

  @override
  String toString() => "Current temp in city: $city is $_currentTemperature";

  int get currentTemperature => _currentTemperature.round();
  int get minTemperature => _minTemperature.round();
  int get maxTemperature => _maxTemperature.round();
}
