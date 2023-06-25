import 'package:json_annotation/json_annotation.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) {
    // Convert the UTC string to DateTime in local time
    return DateTime.parse(json).toLocal();
  }

  @override
  String toJson(DateTime dateTime) {
    // Convert the DateTime to UTC string
    return dateTime.toUtc().toIso8601String();
  }
}
