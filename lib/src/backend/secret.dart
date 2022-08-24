class Api {
  final String key;

  const Api({this.key = ""});

  factory Api.fromJson(Map<String, dynamic> json) =>
      Api(key: json["api_key"] as String);
}
