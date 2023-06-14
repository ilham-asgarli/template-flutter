import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  String get formatForToday {
    final now = DateTime.now();
    final todayStart = DateTime(now.year, now.month, now.day);
    final todayEnd =
        DateTime(now.year, now.month, now.day, 23, 59, 59, 999, 999);
    final format = DateFormat('dd.MM.yyyy');

    if (isBefore(todayStart) || isAfter(todayEnd)) {
      return format.format(this);
    } else {
      return DateFormat.Hm().format(this);
    }
  }

  String get ddMMyyyy {
    final format = DateFormat('dd.MM.yyyy');
    return format.format(this);
  }

  String get Hm {
    return DateFormat.Hm().format(this);
  }
}
