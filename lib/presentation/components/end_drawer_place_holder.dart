import 'package:flutter/material.dart';

import '../widgets/table_place_holder.dart';

class EndDrawerPlaceHolder extends StatelessWidget {
  const EndDrawerPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TablePlaceHolder(
      columnCount: 1,
      rowCount: 15,
    );
  }
}
