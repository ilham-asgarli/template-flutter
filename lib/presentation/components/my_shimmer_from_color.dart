import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/ui/constants/colors/app_colors.dart';

class MyShimmerFromColor extends StatelessWidget {
  final Widget child;
  const MyShimmerFromColor({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighLightColor,
      enabled: true,
      child: child,
    );
  }
}
