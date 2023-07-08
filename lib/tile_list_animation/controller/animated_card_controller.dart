import 'package:flutter/material.dart';

import '../tile_list_widget.dart';

class AnimatedCardController extends State<AnimatedCardCustom> {
  static late AnimatedCardController instance;
  late AnimatedCardCustom view;

  bool onTap = false;
  bool onTapedDown = false;
  
  @override
  Widget build(BuildContext context) => widget.build(context, this);
}