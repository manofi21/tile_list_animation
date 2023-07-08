import 'package:figma_squircle/figma_squircle.dart';

import 'package:flutter/material.dart';

class TileListContainer extends StatelessWidget {
  final Widget child;
  const TileListContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      height: 80,
      width: 400,
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.only(left: 12, right: 16, top: 0),
      decoration: ShapeDecoration(
        // shadows: ,
        color: themeData.colorScheme.secondary,
        shape: SmoothRectangleBorder(
          borderRadius: SmoothBorderRadius(
            cornerRadius: 12,
            cornerSmoothing: 1,
          ),
          side: BorderSide(
            width: 1.5,
            color: themeData.colorScheme.outline,
          ),
        ),
      ),
      child: child,
    );
  }
}
