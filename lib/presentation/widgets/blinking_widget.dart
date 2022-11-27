import 'dart:async';

import 'package:flutter/material.dart';

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
  bool isVisible = false;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: widget.periodDuration), (Timer t) {
      setState(() {
        isVisible = !isVisible;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(
        seconds: widget.animateDuration,
      ),
      child: isVisible ? widget.child : null,
    );
  }
}
