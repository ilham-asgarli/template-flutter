extension StringLocalization on String {}

extension StringConcat on String {
  String concat(String s) => this + s;

  String concatIfNotEmpty(String s) => isNotEmpty ? this + s : "";
}

extension ImagePath on String {
  String get toSVG => 'assets/images/svg/$this.svg';

  String get toPNG => 'assets/images/$this.png';

  String get toJPEG => 'assets/images/$this.jpeg';

  String get toJPG => 'assets/images/$this.jpg';
}

extension Env on String {
  String get toEnv => 'assets/env/$this.env';
}

extension StringCasing on String {
  String toFirstLetterCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toFirstLetterCapitalized())
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

extension Split on String {
  List<String> splitToThree(
    final String regex,
  ) {
    int startIndex = indexOf(regex);
    int endIndex = startIndex + regex.length;

    return startIndex != -1
        ? [
            substring(0, startIndex),
            regex, // = substring(startIndex, endIndex)
            substring(endIndex),
          ]
        : ["", "", ""];
  }
}

extension Check on String? {
  bool get isNull => this == null;
  bool get isNotNull => !isNull;
  bool get isNullOrEmpty => isNull || this!.isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty;
}
