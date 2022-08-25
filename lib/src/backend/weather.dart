class Weather {
  final String city;
  final double currentTemperature;
  final double minTemperature;
  final double maxTemperature;

  const Weather({
    required this.city,
    required this.currentTemperature,
    required this.minTemperature,
    required this.maxTemperature,
  });

  factory Weather.fromJson(String city, Map<String, dynamic> json) => Weather(
        city: city,
        currentTemperature: json["main"]["temp"] as double,
        minTemperature: json["main"]["temp_min"] as double,
        maxTemperature: json["main"]["temp_max"] as double,
      );

  @override
  String toString() => "In city: $city; current temp = $currentTemperature";
}
