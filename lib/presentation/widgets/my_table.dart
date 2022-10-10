import 'package:flutter/material.dart';

import '../../../core/extensions/context_extension.dart';

class MyTable extends StatelessWidget {
  final Map<String?, String?> map;

  const MyTable({required this.map, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: map.entries
          .map(
            (entry) => TableRow(
              children: [
                buildTableRowItem(context, entry.key, true),
                buildTableRowItem(context, entry.value, false),
              ],
            ),
          )
          .toList(),
    );
  }

  Widget buildTableRowItem(BuildContext context, String? text, bool isKey) {
    return Card(
      color: context.colorScheme.background,
      child: Padding(
        padding: context.paddingNormal,
        child: Text(
          text ?? "",
          style: TextStyle(
            fontWeight: isKey ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
