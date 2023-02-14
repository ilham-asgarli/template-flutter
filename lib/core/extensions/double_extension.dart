import 'package:flutter/widgets.dart';

extension DoubleExtension on double? {
  Widget get verticalSpace => SizedBox(
    height: this,
  );

  Widget get horizontalSpace => SizedBox(
    width: this,
  );
}