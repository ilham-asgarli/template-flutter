import 'dart:io';

import 'package:flutter/foundation.dart';

class MyHttpOverrides extends HttpOverrides {
  /// badCertificateCallback must return true for http urls and it will allow to request and get response.
  /// If function returns false it will allow only https calls.
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (
        X509Certificate cert,
        String host,
        int port,
      ) =>
          kDebugMode;
  }
}
