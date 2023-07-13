import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'controller/animated_card_controller.dart';
import 'item_widget/body_tile_widget.dart';
import 'item_widget/suffix_tile_widget.dart';
import 'item_widget/tile_list_container.dart';

class AnimatedCardCustom extends StatefulWidget {
  const AnimatedCardCustom({
    Key? key,
    required this.itemIndex,
    required this.scoreInCurrentDuration,
    required this.userName,
    required this.userProfileUrl,
    this.bgColor = Colors.white,
    this.isCurrentUser = false,
  }) : super(key: key);

  final int itemIndex;
  final Color bgColor;
  final String scoreInCurrentDuration;
  final String userName;
  final String userProfileUrl;
  final bool isCurrentUser;

  Widget build(context, AnimatedCardController stateController) {
    var themeData = Theme.of(context);
    stateController.view = this;

    return TileListContainer(
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTapDown: (_) {
          stateController.changeOnTap(true);
        },
        onTapUp: (_) {
          stateController.changeOnTap(false);
        },
        onTapCancel: () {
          stateController.changeOnTap(false);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  SuffixTileWidget(itemIndex: itemIndex),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 2,
                    child: BodyTileWidget(
                      userName: userName,
                      userProfileUrl: userProfileUrl,
                    ),
                  ),
                  const SizedBox(width: 8)
                ],
              ),
            ),
            Text(
              scoreInCurrentDuration,
              style: themeData.textTheme.titleMedium!
                  .copyWith(color: Colors.white),
            )
                .animate(delay: 150.ms)
                .moveX(begin: 100)
                .then()
                .shakeX(hz: 4, amount: 3)
          ],
        ),
      ),
    )
        .animate(target: stateController.onTap ? 1 : 0)
        .scaleXY(
            begin: 1, end: .85, duration: const Duration(milliseconds: 100))
        .rotate(end: itemIndex.isEven ? .0015 : -.0015);
  }

  @override
  State<StatefulWidget> createState() => AnimatedCardController();
}
