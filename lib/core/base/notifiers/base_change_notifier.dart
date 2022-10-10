import 'package:flutter/foundation.dart';

class BaseChangeNotifier with ChangeNotifier {
  bool isDisposed = false;

  @override
  void notifyListeners() {
    if(!isDisposed) {
      super.notifyListeners();
    }
  }
}