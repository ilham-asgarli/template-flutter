import 'package:flutter/widgets.dart';

extension WidgetExtension on Widget {
  Widget get toSliver => SliverToBoxAdapter(child: this);
}
