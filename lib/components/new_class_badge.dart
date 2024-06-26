import 'package:flutter/material.dart';
import 'package:learn/utils.dart';

class NewClassBadge extends StatelessWidget {
  final Children children;
  const NewClassBadge({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    final String level = getLevel(children.pontuation)["level"];
    return Stack(
      children: [
        Image.asset(
          "assets/images/levels/badge-${level.toLowerCase()}.png",
          height: 88,
        ),
        Container(
            height: 88,
            width: 110,
            padding: const EdgeInsets.all(16),
            child: Text(level, style: CoinnyTextStyles.body_2_medium()))
      ],
    );
  }
}
