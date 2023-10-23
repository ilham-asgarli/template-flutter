import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../presentation/widgets/have_no.dart';
import '../../../utils/extensions/context_extension.dart';

class NotFoundNavigationView extends StatelessWidget {
  const NotFoundNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: HaveNo(
            description: context.l10n.notFoundNavigation,
            iconData: FontAwesomeIcons.ban,
          ),
        ),
      ),
    );
  }
}
