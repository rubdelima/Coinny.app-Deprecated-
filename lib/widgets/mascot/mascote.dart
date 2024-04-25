import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:learn/classes.dart';

class MascoteWidget extends StatelessWidget {
  final String backgroundName;
  final String mascotType;
  final Children child;

  MascoteWidget({
    this.backgroundName="",
    this.mascotType="",
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/mascote/backgroundLarge.png',
              fit: BoxFit.cover,
            ),
          ),
           Center(
            child:
            SizedBox(
              width: MediaQuery.sizeOf(context).width -120,
              child :RiveAnimation.asset('assets/animations/coinny.riv')
              ),

          ),
      ],
    );
  }
}
