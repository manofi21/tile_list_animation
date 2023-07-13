import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SuffixTileWidget extends StatelessWidget {
  final int itemIndex;
  const SuffixTileWidget({
    super.key,
    required this.itemIndex,
  });

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          (itemIndex + 1).toString(),
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
        alignment: Alignment.topCenter);
  }
}
