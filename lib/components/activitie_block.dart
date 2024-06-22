import 'package:flutter/material.dart';

class Block {
  String title;
  String subtitle;
  int state;
  Color blockColor;

  Block({
    required this.title,
    required this.subtitle,
    required this.state,
    required this.blockColor,
  });
}

class AnimatedBlock extends StatefulWidget {
  final Block block;
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
        if (widget.block.state == 2) {
          _showBlockDetails(context, widget.block);
        }
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _showBlockDetails(BuildContext context, Block block) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: EdgeInsets.all(40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(block.title, style: TextStyle(fontSize: 24)),
                    Text(block.subtitle, style: TextStyle(fontSize: 16)),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          block.state = 3;
                        });
                      },
                      child: Text('X'),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
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
            onTap: widget.block.state == 1
                ? null
                : () {
                    if (widget.block.state == 2) {
                      _showBlockDetails(context, widget.block);
                    } else if (widget.block.state == 3) {
                      _showBlockDetails(context, widget.block);
                    }
                  },
            child: Opacity(
              opacity: _animation.value,
              child: Container(
                height: widget.heigth,
                decoration: BoxDecoration(
                  color: widget.block.state == 1
                      ? Theme.of(context).canvasColor
                      : widget.block.state == 2
                          ? Colors.yellow
                          : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    widget.block.title,
                    style: TextStyle(
                      color:
                          widget.block.state == 1 ? Colors.grey : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
