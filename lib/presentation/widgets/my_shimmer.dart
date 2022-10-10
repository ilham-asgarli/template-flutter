import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer extends StatelessWidget {
  final Widget child;
  final Color color;

  const MyShimmer({required this.child, required this.color, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      enabled: true,
      gradient: LinearGradient(
        colors: [
          color.withOpacity(1),
          color.withOpacity(0.8),
          color.withOpacity(0.7),
          color.withOpacity(0.6),
          color.withOpacity(0.5),
          color.withOpacity(0.4),
          color.withOpacity(0.3),
          color.withOpacity(0.2),
          color.withOpacity(0.1),
          color.withOpacity(0),
        ],
      ),
      child: child,
    );
  }
}
