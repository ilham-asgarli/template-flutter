import 'package:flutter/material.dart';

class FadeView extends StatelessWidget {
  final Color? color;
  final Alignment begin, end;

  const FadeView({
    Key? key,
    this.color,
    required this.begin,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color c = color ?? Theme.of(context).scaffoldBackgroundColor;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          stops: const [0.0, 1.0],
          colors: [
            c.withOpacity(0.0),
            c,
          ],
        ),
      ),
    );
  }
}
