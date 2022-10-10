import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

extension WidgetExtension on Widget {
  Widget get toSliver {
    return SliverToBoxAdapter(child: this);
  }

  Widget verticalSpace(BuildContext context, double val) => SizedBox(
        height: context.dynamicHeight(val),
      );

  Widget horizontalSpace(BuildContext context, double val) => SizedBox(
    width: context.dynamicWidth(val),
  );
}
