import 'package:flutter/foundation.dart';

extension StringConcat on String {
  String concat(String s) => this + s;

  String concatIfNotEmpty(String s) => isNotEmpty ? this + s : "";
}

extension EnvPath on String {
  String get toEnv => kDebugMode ? toEnvDevelopment : toEnvProduction;

  String get toEnvDevelopment => '$this.env.development';

  String get toEnvProduction => '$this.env.production';

  String get toEnvExample => '$this.env.example';
}

extension StringCasing on String {
  String get toFirstLetterCapitalized =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String get toTitleCase => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toFirstLetterCapitalized)
      .join(' ');
}

extension Enum on String {
  T? valueToEnum<T>(Iterable<T?> values) {
    return values.firstWhere(
      (type) => type.toString().split(".").last == this,
    );
  }

  T? toEnum<T>(Iterable<T?> values) {
    return values.firstWhere(
      (type) => type.toString() == this,
    );
  }
}

extension Check on String? {
  bool get isNull => this == null;

  bool get isNotNull => !isNull;

  bool get isNullOrEmpty => isNull || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension Validation on String? {
  bool get isEmail {
    if (isNull) {
      return false;
    }

    const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(this!);
  }
}
