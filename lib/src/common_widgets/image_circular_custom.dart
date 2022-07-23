import 'package:flutter/material.dart';

class ImageCircularCustom extends StatelessWidget {
  const ImageCircularCustom({
    Key? key,
    required this.image,
    this.size,
  }) : super(key: key);

  final String image;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: size,
      backgroundImage: NetworkImage(image),
    );
  }
}
