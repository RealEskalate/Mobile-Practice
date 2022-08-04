import 'package:flutter/material.dart';

class CircularAvator extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final Function? onPressed;
  const CircularAvator(
      {Key? key, this.radius = 17, required this.imageUrl, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
      },
      child: CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(imageUrl),
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
