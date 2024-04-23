import 'package:flutter/material.dart';


class LessionProgressBar extends StatefulWidget {
  final double percentage; // Porcentagem para preenchimento da barra de progresso

  LessionProgressBar({required this.percentage});

  @override
  _LessionProgressBarState createState() => _LessionProgressBarState();
}

class _LessionProgressBarState extends State<LessionProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000), // A animação dura 2 segundos
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: widget.percentage).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward(); // Inicia a animação
  }

  Color _getColor(double value) {
    if (value <= 20) {
      return Colors.red;
    } else if (value <= 60) {
      return Colors.amber;
    } else {
      return Colors.green;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double barWidth = 240.0;
    final double barHeight = 30.0; 

    return Stack(
      children: [
        // Retângulo branco (fundo)
        Container(
          width: barWidth,
          height: barHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        // Retângulo colorido (progresso)
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: barWidth * (_animation.value / 100),
              height: barHeight,
              decoration: BoxDecoration(
                color: _getColor(_animation.value),
                borderRadius: BorderRadius.circular(40),
              ),
            );
          },
        ),
        // Retângulo com opacidade (overlay)
        Container(
          margin: const EdgeInsets.only(top:2, left: 4),
          width: (barWidth * (_animation.value / 100))-16 > 0 ? (barWidth * (_animation.value / 100))-16 : 0,
          height: barHeight*0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
