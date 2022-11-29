import 'package:flutter/material.dart';

import '../../utils/ui/constants/colors/app_colors.dart';

class FractionallySizedCircularProgressIndicator extends StatelessWidget {
  final double factor;
  final Color? color;

  const FractionallySizedCircularProgressIndicator({
    this.factor = 1,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          width: constraints.maxHeight * factor,
          height: constraints.maxHeight * factor,
          child: CircularProgressIndicator(
            color: color ?? AppColors.secondColor,
          ),
        );
      },
    );
  }
}
