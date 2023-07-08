// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

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
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => AnimatedCardController();
}
