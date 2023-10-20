import 'package:flutter/widgets.dart';

extension NumExtension on num? {
  Widget get verticalSpace => SizedBox(
    height: this?.toDouble(),
  );

  Widget get horizontalSpace => SizedBox(
    width: this?.toDouble(),
  );
}