import 'package:flutter/material.dart';

class PulsingCircleAvatar extends StatefulWidget {
  final Color circleColor;
  final String imagePath;

  PulsingCircleAvatar({required this.circleColor, required this.imagePath});

  @override
  _PulsingCircleAvatarState createState() => _PulsingCircleAvatarState();
}

class _PulsingCircleAvatarState extends State<PulsingCircleAvatar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _scaleAnimations;
  late List<Animation<double>> _opacityAnimations;
  final int _numCircles = 4;
  final int _animationDuration = 4; // Duration in seconds for one cycle of animation

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: _animationDuration),
      vsync: this,
    )..repeat();

    _scaleAnimations = List<Animation<double>>.generate(
      _numCircles,
      (index) => Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index / _numCircles, 1.0, curve: Curves.easeOut),
        ),
      ),
    );

    _opacityAnimations = List<Animation<double>>.generate(
      _numCircles,
      (index) => Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index / _numCircles, 1.0, curve: Curves.easeOut),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              ...List<Widget>.generate(
                _numCircles,
                (index) {
                  return Transform.scale(
                    scale: _scaleAnimations[index].value,
                    child: CustomPaint(
                      painter: CirclePainter(widget.circleColor, _opacityAnimations[index].value),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                      ),
                    ),
                  );
                },
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(widget.imagePath), // Caminho da imagem
              ),
            ],
          );
        },
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final Color color;
  final double opacity;

  CirclePainter(this.color, this.opacity);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
