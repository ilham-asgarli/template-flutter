import 'package:flutter/material.dart';

import 'fade_view.dart';

class FadeSingleChildScrollView extends StatefulWidget {
  final Widget? child;
  final Color? color;
  final double fadeSize;
  final Axis scrollDirection;

  const FadeSingleChildScrollView({
    Key? key,
    this.child,
    this.color,
    this.scrollDirection = Axis.vertical,
    this.fadeSize = 70,
  }) : super(key: key);

  @override
  State<FadeSingleChildScrollView> createState() =>
      _FadeSingleChildScrollViewState();
}

class _FadeSingleChildScrollViewState extends State<FadeSingleChildScrollView> {
  bool start = false, end = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        NotificationListener(
          child: SingleChildScrollView(
            scrollDirection: widget.scrollDirection,
            child: widget.child,
          ),
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification) {
              if (!start && notification.metrics.pixels > 0) {
                setState(() {
                  start = true;
                });
              } else if (start && notification.metrics.pixels == 0) {
                setState(() {
                  start = false;
                });
              }

              if (!end &&
                  notification.metrics.pixels <
                      notification.metrics.maxScrollExtent) {
                setState(() {
                  end = true;
                });
              } else if (end &&
                  notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent) {
                setState(() {
                  end = false;
                });
              }
            }

            return true;
          },
        ),
        Visibility(
          visible: start,
          child: Positioned(
            top: -1,
            left: -1,
            right: widget.scrollDirection == Axis.vertical ? -1 : null,
            height: widget.scrollDirection == Axis.vertical
                ? widget.fadeSize
                : null,
            bottom: widget.scrollDirection == Axis.horizontal ? -1 : null,
            width: widget.scrollDirection == Axis.horizontal
                ? widget.fadeSize
                : null,
            child: FadeView(
              color: widget.color,
              begin: widget.scrollDirection == Axis.vertical
                  ? Alignment.bottomCenter
                  : Alignment.centerRight,
              end: widget.scrollDirection == Axis.vertical
                  ? Alignment.topCenter
                  : Alignment.centerLeft,
            ),
          ),
        ),
        Visibility(
          visible: end,
          child: Positioned(
            bottom: -1,
            right: -1,
            left: widget.scrollDirection == Axis.vertical ? -1 : null,
            height: widget.scrollDirection == Axis.vertical
                ? widget.fadeSize
                : null,
            top: widget.scrollDirection == Axis.horizontal ? -1 : null,
            width: widget.scrollDirection == Axis.horizontal
                ? widget.fadeSize
                : null,
            child: FadeView(
              color: widget.color,
              begin: widget.scrollDirection == Axis.vertical
                  ? Alignment.topCenter
                  : Alignment.centerLeft,
              end: widget.scrollDirection == Axis.vertical
                  ? Alignment.bottomCenter
                  : Alignment.centerRight,
            ),
          ),
        ),
      ],
    );
  }
}
