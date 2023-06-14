abstract class RouterInterface {
  Future<void> pushNamed<T extends Object?>({
    required String path,
    Object? data,
  });

  Future<void> pushNamedAndRemoveUntil<T extends Object?>({
    required String path,
    Object? data,
  });

  Future<void> pushReplacementNamed<T extends Object?>({
    required String path,
    Object? data,
  });

  void pop<T extends Object?>([T? result]);

  void popUntil({String? removeUntilPageName});
}
