import 'package:flutter/material.dart';

import '../../utils/ui/constants/colors/app_colors.dart';

class FractionallySizedCircularProgressIndicator extends StatelessWidget {
  final double factor;

  const FractionallySizedCircularProgressIndicator({this.factor = 1, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(
          width: constraints.maxHeight * factor,
          height: constraints.maxHeight * factor,
          child: const CircularProgressIndicator(
            color: AppColors.secondColor,
          ),
        );
      },
    );
  }
}
