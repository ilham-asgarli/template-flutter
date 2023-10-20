import 'package:flutter/material.dart';

class BaseBrightnessChangeView extends StatefulWidget {
  final Widget child;
  final Function()? onChange;

  const BaseBrightnessChangeView({
    Key? key,
    required this.child,
    this.onChange,
  }) : super(key: key);

  @override
  State<BaseBrightnessChangeView> createState() =>
      _BaseBrightnessChangeViewState();
}

class _BaseBrightnessChangeViewState extends State<BaseBrightnessChangeView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    widget.onChange?.call();
    super.didChangePlatformBrightness();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
