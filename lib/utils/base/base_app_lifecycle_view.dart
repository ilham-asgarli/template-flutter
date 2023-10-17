import 'package:flutter/material.dart';

class BaseAppLifeCycleView extends StatefulWidget {
  final Widget child;
  final Function()? onResume;
  final Function()? onPause;
  final Function()? onInactive;
  final Function()? onDetach;
  final Function()? onHidden;

  const BaseAppLifeCycleView({
    Key? key,
    required this.child,
    this.onResume,
    this.onPause,
    this.onInactive,
    this.onDetach,
    this.onHidden,
  }) : super(key: key);

  @override
  State<BaseAppLifeCycleView> createState() => _BaseAppLifeCycleViewState();
}

class _BaseAppLifeCycleViewState extends State<BaseAppLifeCycleView>
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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        widget.onResume?.call();
        break;
      case AppLifecycleState.inactive:
        widget.onInactive?.call();
        break;
      case AppLifecycleState.paused:
        widget.onPause?.call();
        break;
      case AppLifecycleState.detached:
        widget.onDetach?.call();
        break;
      case AppLifecycleState.hidden:
        widget.onHidden?.call();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
