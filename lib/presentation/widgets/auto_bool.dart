import 'dart:async';

import 'package:flutter/material.dart';

class AutoBool extends StatefulWidget {
  final Widget Function(bool b) child;
  final int periodDuration;

  const AutoBool({
    required this.child,
    this.periodDuration = 1,
    Key? key,
  }) : super(key: key);

  @override
  State<AutoBool> createState() => _AutoBoolState();
}

class _AutoBoolState extends State<AutoBool> {
  late Timer timer;
  bool b = false;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: widget.periodDuration), (Timer t) {
      setState(() {
        b = !b;
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
    return widget.child(b);
  }
}
