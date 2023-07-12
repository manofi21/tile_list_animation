// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'controller/animated_card_controller.dart';
import 'item_widget/tile_list_container.dart';
import 'model/animated_card_model.dart';

class AnimatedCardCustom extends StatefulWidget {
  const AnimatedCardCustom({
    Key? key,
    required this.animatedCardModel,
  }) : super(key: key);

  final AnimatedCardModel animatedCardModel;

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
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        (animatedCardModel.itemIndex + 1).toString(),
                        style: themeData.textTheme.titleLarge!.copyWith(
                          fontSize: 24.2,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ).animate().rotate(
                      begin: .4,
                      duration: 200.ms,
                      delay: 200.ms,
                      alignment: Alignment.topCenter),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                    ),
                    height: 100,
                    width: 74,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        animatedCardModel.userProfileUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 150),
                  Expanded(
                    child: Text(
                      animatedCardModel.userName,
                      overflow: TextOverflow.ellipsis,
                      style: themeData.textTheme.bodyLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 8)
                ],
              ),
            ),
            Text(
              animatedCardModel.scoreInCurrentDuration,
              style: themeData.textTheme.titleMedium!
                  .copyWith(color: Colors.green[600]),
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
        .rotate(end: animatedCardModel.itemIndex.isEven ? .0015 : -.0015);
  }

  @override
  State<StatefulWidget> createState() => AnimatedCardController();
}
