extension IntExtension on int? {
  String toFixed(int count, {bool visibility = false}) {
    if (this != null) {
      if (toString().length == count) {
        return toString();
      } else {
        return "${"0" * (count - toString().length)}${toString()}";
      }
    } else {
      return visibility ? "00" : "";
    }
  }

  int toZeroOrPositive() {
    int i = this ?? 0;
    return i < 0 ? 0 : i;
  }
}
