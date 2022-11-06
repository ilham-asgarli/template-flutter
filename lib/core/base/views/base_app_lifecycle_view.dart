import 'package:flutter/material.dart';

class BaseAppLifeCycleView extends StatefulWidget {
  final Widget child;

  const BaseAppLifeCycleView({Key? key, required this.child}) : super(key: key);

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
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
