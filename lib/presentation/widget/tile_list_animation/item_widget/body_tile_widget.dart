import 'package:flutter/material.dart';

class BodyTileWidget extends StatelessWidget {
  const BodyTileWidget(
      {super.key, required this.userName, required this.userProfileUrl});

  final String userName;
  final String userProfileUrl;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
          ),
          height: 100,
          width: 74,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              userProfileUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text(
            userName,
            overflow: TextOverflow.ellipsis,
            style: themeData.textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
