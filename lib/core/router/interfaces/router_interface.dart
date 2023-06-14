import 'package:flutter/widgets.dart';

abstract class RouterInterface {
  Future<void> pushNamed<T extends Object?>({
    BuildContext? context,
    required String path,
    Object? data,
  });

  Future<void> pushNamedAndRemoveUntil<T extends Object?>({
    BuildContext? context,
    required String path,
    Object? data,
  });

  Future<void> pushReplacementNamed<T extends Object?, TO extends Object?>({
    BuildContext? context,
    required String path,
    Object? data,
  });

  void pop<T extends Object?>([BuildContext? context, T? result]);

  void popUntil({BuildContext? context, String? removeUntilPageName});
}
