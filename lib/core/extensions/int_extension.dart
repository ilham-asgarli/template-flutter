extension IntExtension on int? {
  String toFixed(int count) {
    if (this != null) {
      if (toString().length == count) {
        return toString();
      } else {
        return "${"0" * (count - toString().length)}${toString()}";
      }
    } else {
      return "";
    }
  }
}
