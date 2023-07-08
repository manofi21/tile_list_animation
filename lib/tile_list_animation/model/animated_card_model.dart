import 'package:flutter/material.dart';

class AnimatedCardModel {
  final int itemIndex;
  final Color bgColor;
  final String scoreInCurrentDuration;
  final String userName;
  final String userProfileUrl;
  final bool isCurrentUser;

  AnimatedCardModel(this.itemIndex, this.bgColor, this.scoreInCurrentDuration, this.userName, this.userProfileUrl, this.isCurrentUser);
}