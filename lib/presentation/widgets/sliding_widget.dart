import 'package:flutter/material.dart';

class SlidingWidget extends StatefulWidget {
  final Widget? child;
  final double translateLimit;
  final Function()? onHide;

  const SlidingWidget({
    super.key,
    this.child,
    this.translateLimit = 200,
    this.onHide,
  });

  @override
  State<SlidingWidget> createState() => _SlidingWidgetState();
}

class _SlidingWidgetState extends State<SlidingWidget> {
  double translateY = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        setState(() {
          if (translateY + details.delta.dy > 0) {
            translateY += details.delta.dy;
          }
        });
      },
      onVerticalDragEnd: (details) {
        if (translateY > widget.translateLimit && widget.onHide != null) {
          widget.onHide!();
        }
        setState(() {
          translateY = 0.0;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0.0, translateY, 0.0),
        child: widget.child,
      ),
    );
  }
}
