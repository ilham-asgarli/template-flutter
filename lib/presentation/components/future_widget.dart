import 'package:flutter/material.dart';

class FutureWidget<T> extends StatelessWidget {
  final AsyncSnapshot<T> snapshot;
  final Widget Function(T) successWidget;
  final Widget? waitingWidget;
  final Widget? errorWidget;
  final Widget? nullWidget;

  const FutureWidget({
    Key? key,
    required this.snapshot,
    required this.successWidget,
    this.waitingWidget,
    this.errorWidget,
    this.nullWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (snapshot.connectionState) {
      case ConnectionState.waiting:
        return snapshot.hasData
            ? successWidget(snapshot.data as T)
            : waitingWidget ??
                const Center(
                  child: CircularProgressIndicator(),
                );
      case ConnectionState.done:
      default:
        if (snapshot.hasError) {
          return errorWidget ?? const SizedBox.shrink();
        } else if (snapshot.hasData) {
          return successWidget(snapshot.data as T);
        } else {
          return nullWidget ?? const SizedBox.shrink();
        }
    }
  }
}
