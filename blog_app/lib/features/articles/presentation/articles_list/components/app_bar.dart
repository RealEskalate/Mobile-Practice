import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/assets.dart';
import 'circular_avatar.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(Assets.filter, semanticsLabel: 'Filter icon'),
        const Text(
          "Welcome back!!",
          textAlign: TextAlign.center,
        ),
        CircularAvator(
            onPressed: () {
              debugPrint("UserProfile clicked");
            },
            imageUrl:
                "https://previews.123rf.com/images/rido/rido2002/rido200200099/141040315-happy-smiling-african-doctor-looking-at-camera-in-medical-office-portrait-of-black-man-doctor-workin.jpg?fj=1")
      ],
    );
  }
}
