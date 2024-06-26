import 'package:flutter/material.dart';
import 'package:learn/utils.dart';

class NewClassBadge extends StatelessWidget {
  final Children children;
  final double height;
  final double width;
  const NewClassBadge({
    required this.children, 
    this.height = 88,
    this.width = 110,
    super.key});

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
            height: height,
            width: width,
            padding: const EdgeInsets.all(16),
            child: Text(level, style: CoinnyTextStyles.body_2_medium()))
      ],
    );
  }
}
