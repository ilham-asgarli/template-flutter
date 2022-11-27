import 'package:flutter/material.dart';

import 'auto_bool.dart';

class BlinkingWidget extends StatefulWidget {
  final Widget child;
  final int periodDuration;
  final int animateDuration;

  const BlinkingWidget({
    required this.child,
    this.periodDuration = 1,
    this.animateDuration = 1,
    Key? key,
  }) : super(key: key);

  @override
  State<BlinkingWidget> createState() => _BlinkingWidgetState();
}

class _BlinkingWidgetState extends State<BlinkingWidget> {
  @override
  Widget build(BuildContext context) {
    return AutoBool(
      child: (b) {
        return AnimatedSwitcher(
          duration: Duration(
            seconds: widget.animateDuration,
          ),
          child: b ? widget.child : null,
        );
      },
    );
  }
}
