import 'package:flutter/material.dart';

import '../../core/extensions/num_extension.dart';

class RadioTile<T> extends StatefulWidget {
  final Widget? title;
  final EdgeInsets padding;
  final T? groupValue;
  final T value;
  final Function(T?)? onChanged;
  final double titleLeftPadding;

  const RadioTile({
    Key? key,
    this.title,
    this.padding = EdgeInsets.zero,
    this.titleLeftPadding = 10,
    this.groupValue,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  State<RadioTile<T>> createState() => _RadioTileState<T>();
}

class _RadioTileState<T> extends State<RadioTile<T>> {
  late T? groupValue;

  @override
  void initState() {
    groupValue = widget.groupValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: defaultOnChanged,
      child: Padding(
        padding: widget.padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<T>(
              visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity,
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              groupValue: groupValue,
              value: widget.value,
              toggleable: true,
              onChanged: (T? newValue) {
                defaultOnChanged();
              },
            ),
            widget.titleLeftPadding.horizontalSpace,
            Expanded(
              child: widget.title ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  void defaultOnChanged() {
    if (widget.onChanged != null) widget.onChanged!(groupValue);
    if (widget.value != groupValue) {
      setState(() {
        groupValue = widget.value;
      });
    } else {
      setState(() {
        groupValue = null;
      });
    }
  }
}
