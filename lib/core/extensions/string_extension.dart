extension StringLocalization on String {}

extension StringConcat on String {
  concat(String s) => this + s;
  concatIfNotEmpty(String s) => isNotEmpty ? this + s : "";
}

extension ImagePathExtension on String {
  String get toSVG => 'assets/images/svg/$this.svg';
  String get toPNG => 'assets/images/$this.png';
}

extension StringCasingExtension on String {
  String toFirstLetterCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toFirstLetterCapitalized())
      .join(' ');
}

extension EnumExtension on String {
  T? valueToEnum<T>(Iterable<T?> values) {
    return values.firstWhere(
      (type) => type.toString().split(".").last == this,
      orElse: () => null,
    );
  }

  T? toEnum<T>(Iterable<T?> values) {
    return values.firstWhere(
      (type) => type.toString() == this,
      orElse: () => null,
    );
  }
}
