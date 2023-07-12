import 'package:flutter/material.dart';

class AnimatedCardModel {
  final int itemIndex;
  final Color bgColor;
  final String scoreInCurrentDuration;
  final String userName;
  final String userProfileUrl;
  final bool isCurrentUser;

  AnimatedCardModel({
    required this.itemIndex,
    required this.scoreInCurrentDuration,
    required this.userName,
    required this.userProfileUrl,
    this.bgColor = Colors.white,
    this.isCurrentUser = false,
  });
}
