extension Put on Map {
  dynamic putIfNotNull(dynamic key, dynamic value) =>
      value != null ? putIfAbsent(key, () => value) : null;
}
