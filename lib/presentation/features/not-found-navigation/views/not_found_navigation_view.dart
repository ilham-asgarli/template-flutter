import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../presentation/widgets/have_no.dart';
import '../../../../utils/logic/constants/locale/locale_keys.g.dart';

class NotFoundNavigationView extends StatelessWidget {
  const NotFoundNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: HaveNo(
            description: LocaleKeys.notFoundNavigation.tr(),
            iconData: FontAwesomeIcons.ban,
          ),
        ),
      ),
    );
  }
}
