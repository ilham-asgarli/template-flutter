import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/extensions/context_extension.dart';

class HaveNo extends StatelessWidget {
  final IconData iconData;
  final String description;

  const HaveNo({
    required this.description,
    required this.iconData,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            iconData,
            size: 100,
            color: context.colorScheme.secondary,
          ),
          context.dynamicVerticalSpace(0.05),
          Text(
            description,
            style: TextStyle(
              color: context.colorScheme.secondary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
