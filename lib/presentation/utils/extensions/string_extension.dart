import 'iterable_extension.dart';

extension StringConcat on String {
  String concat(String s) => this + s;

  String concatIfNotEmpty(String s) => isNotEmpty ? this + s : "";
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
  T? asEnum<T>(List<T> values) {
    return values.firstWhereOrNull(
      (e) => e.toString().split('.').last == this,
    );
  }

  T asEnumOr<T>(List<T> values, T defaultValue) {
    return values.firstWhere(
      (e) => e.toString().split('.').last == this,
      orElse: () => defaultValue,
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
