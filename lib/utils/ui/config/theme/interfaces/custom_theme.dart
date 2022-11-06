import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common/common_theme.dart';

abstract class CustomTheme {
  ThemeData getTheme({required ThemeData modeThemeData});

  SystemUiOverlayStyle systemUiOverlayStyle() {
    return CommonTheme.instance.systemUiOverlayStyle();
  }
}
