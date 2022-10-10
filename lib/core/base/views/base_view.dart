import 'package:flutter/material.dart';

class BaseView<T> extends StatefulWidget {
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  final VoidCallback? onDispose;

  const BaseView(
      {Key? key,
      required this.viewModel,
      required this.onPageBuilder,
      required this.onModelReady,
      this.onDispose})
      : super(key: key);

  @override
  BaseViewState<T> createState() => BaseViewState<T>();
}

class BaseViewState<T> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return widget.onPageBuilder(context, model);
  }
}
