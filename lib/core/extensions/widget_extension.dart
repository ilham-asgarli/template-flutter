import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

extension WidgetExtension on Widget {
  Widget get toSliver {
    return SliverToBoxAdapter(child: this);
  }

  Widget dynamicVerticalSpace(BuildContext context, double val) => SizedBox(
        height: context.dynamicHeight(val),
      );

  Widget dynamicHorizontalSpace(BuildContext context, double val) => SizedBox(
        width: context.dynamicWidth(val),
      );

  Widget verticalSpace(double val) => SizedBox(
        height: val,
      );

  Widget horizontalSpace(double val) => SizedBox(
        width: val,
      );
}
