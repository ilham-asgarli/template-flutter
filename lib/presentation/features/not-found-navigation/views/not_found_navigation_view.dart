import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../presentation/widgets/have_no.dart';

class NotFoundNavigationView extends StatelessWidget {
  const NotFoundNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: HaveNo(
            description: context.localization.notFoundNavigation,
            iconData: FontAwesomeIcons.ban,
          ),
        ),
      ),
    );
  }
}
