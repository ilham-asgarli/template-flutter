import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AutoIndex extends StatefulWidget {
  final Widget Function(int index) child;
  final int periodDuration;
  final int itemCount;

  const AutoIndex({
    required this.child,
    required this.itemCount,
    this.periodDuration = 1,
    Key? key,
  }) : super(key: key);

  @override
  State<AutoIndex> createState() => _AutoIndexState();
}

class _AutoIndexState extends State<AutoIndex> {
  Random random = Random();
  late Timer timer;
  int index = 0;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: widget.periodDuration), (Timer t) {
      setState(() {
        index = random.nextInt(widget.itemCount);
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
    return widget.child(index);
  }
}
