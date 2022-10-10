import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final ImageProvider? imageProvider;
  final double radius;

  const ImagePlaceholder({
    Key? key,
    required this.imageProvider,
    this.radius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      //backgroundColor: MyColors.mainColor,
      backgroundImage: imageProvider,
    );
  }
}
