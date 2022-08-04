import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/styles.dart';

class DrawerTile extends StatelessWidget {
  final String semanticLable;
  final String assetPath;
  final String title;
  final double paddingLeft;
  final Function onPressed;

  const DrawerTile({
    Key? key,
    this.paddingLeft = 0,
    required this.onPressed,
    required this.title,
    required this.assetPath,
    this.semanticLable = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: CustomColors.drawerBodyBkg,
      onTap: () {
        onPressed();
        debugPrint("Drawer Tile pressed");
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(paddingLeft, 12, 0, 12),
        child: Row(
          children: [
            SvgPicture.asset(assetPath, semanticsLabel: semanticLable),
            const SizedBox(
              width: 24,
            ),
            Text(
              title,
              style: Styles.drawerTileStyle,
            )
          ],
        ),
      ),
    );
  }
}
