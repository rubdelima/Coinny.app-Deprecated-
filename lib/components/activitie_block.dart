import 'package:flutter/material.dart';

class ActivitieBlock {
  String imagePath;
  int state;
  void Function()? onPressed;


  ActivitieBlock({
    required this.imagePath,
    required this.state,
    this.onPressed,
  });
}

class AnimatedBlock extends StatefulWidget {
  final ActivitieBlock block;
  final int index;
  final double heigth;

  const AnimatedBlock({
    required this.block, 
  required this.index, 
  required this.heigth,
  Key? key})
      : super(key: key);

  @override
  _AnimatedBlockState createState() => _AnimatedBlockState();
}

class _AnimatedBlockState extends State<AnimatedBlock>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    Future.delayed(Duration(milliseconds: widget.index * 200), () {
      _animationController.forward().then((value) {
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        double topOffset =
            (1 - _animation.value) * (MediaQuery.of(context).size.height / 2) +
                (widget.index * 80) * (1 - _animation.value) -
                (widget.index * 16) * _animation.value +
                widget.index * 20;
        return Transform.translate(
          offset: Offset(0, topOffset),
          child: GestureDetector(
            onTap: widget.block.onPressed,
            child: Image.asset(widget.block.imagePath, width: MediaQuery.sizeOf(context).width/2 - 24,),
          ),
        );
      },
    );
  }
}