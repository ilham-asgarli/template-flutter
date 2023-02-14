import 'package:flutter/widgets.dart';

import '../../../core/extensions/context_extension.dart';
import '../constants/enums/app_enum.dart';

extension WidgetExtension on Widget {
  Widget get toSliver => SliverToBoxAdapter(child: this);

  Widget dynamicVerticalSpace(BuildContext context, double val) => SizedBox(
        height: context.dynamicHeight(val),
      );

  Widget dynamicHorizontalSpace(BuildContext context, double val) => SizedBox(
        width: context.dynamicWidth(val),
      );

  Widget dynamicMinSizePropertySpace(BuildContext context, double val) =>
      SizedBox(
        width: context.minSizeProperty == SizeProperty.width ? val : 0,
        height: context.minSizeProperty == SizeProperty.height ? val : 0,
      );
}
