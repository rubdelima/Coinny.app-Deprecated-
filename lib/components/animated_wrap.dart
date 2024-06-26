import 'package:flutter/material.dart';
import 'package:learn/components/activitie_block.dart';

class AnimatedColumns extends StatefulWidget {
  final List<ActivitieBlock> blocks;

  const AnimatedColumns({required this.blocks, Key? key}) : super(key: key);

  @override
  _AnimatedColumnsState createState() => _AnimatedColumnsState();
}

class _AnimatedColumnsState extends State<AnimatedColumns> {
  //int completedAnimations = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> column1 = [];
    List<Widget> column2 = [];
    final widgetSize = MediaQuery.sizeOf(context).width - 48;

    for (int i = 0; i < widget.blocks.length; i++) {
      if (i % 2 == 0) {
        column1.add(AnimatedBlock(
          block: widget.blocks[i],
          index: i,
          heigth: 104,
        ));
      } else {
        column2.add(AnimatedBlock(
          block: widget.blocks[i],
          index: i,
          heigth: 232,
        ));
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: widgetSize * 0.5, child: Column(children: column1)),
        const SizedBox(
          width: 16,
        ),
        SizedBox(width: widgetSize * 0.5, child: Column(children: column2)),
      ],
    );
  }
}