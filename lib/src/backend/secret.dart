/// Класс для хранения ключей api
/// Можно использовать в связке с файлом json, в котором находится ключ
/// Либо с ответом от сервера
class Api {
  final String key;

  const Api({this.key = ""});

  factory Api.fromJson(Map<String, dynamic> json) =>
      Api(key: json["api_key"] as String);
}
