import 'package:flutter/material.dart';
import 'package:learn/widgets/activities/activitieCardStatic.dart';
import 'package:learn/pages/activities/activitieMain.dart';
import 'package:learn/utils/modelsClass.dart';

class ActivitieCard extends StatefulWidget {
  final ActivitieCardStatic activitie;
  final bool isActivitie;
  final VolatileChildren child;

  ActivitieCard({
    required this.activitie,
    this.isActivitie = false,
    required this.child,
  });

  @override
  _ActivitieCardState createState() => _ActivitieCardState();
}

class _ActivitieCardState extends State<ActivitieCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.1)
      .animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
          reverseCurve: Curves.easeIn,
        ),
      );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTap() {
    if (!widget.activitie.isLocked) {
      widget.activitie.withProgress = true;
      Navigator.push(
            context, MaterialPageRoute(builder: (context) => ActivitieMain(content: widget.activitie, child: widget.child))
          );
    }
    _animationController
      .forward()
      .then((_) => _animationController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            alignment: Alignment.center, // Garante que a escala é do centro
            child: child,
          );
        },
        child: widget.activitie,
      ),
    );
  }
}