// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'controller/animated_card_controller.dart';
import 'model/animated_card_model.dart';

class AnimatedCardCustom extends StatefulWidget {
  const AnimatedCardCustom({
    Key? key,
    required this.animatedCardModel,
  }) : super(key: key);

  final AnimatedCardModel animatedCardModel;

  Widget build(context, AnimatedCardController stateController) {
  stateController.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
  
  @override
  State<StatefulWidget> createState() => AnimatedCardController();
}
