import 'package:flutter/material.dart';

class LearnBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color buttonColor;
  final Color iconColor;

  LearnBackButton({
    this.onPressed,
    this.buttonColor = const Color(0xff101573),
    this.iconColor = const Color(0xffffffff),
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: iconColor),
                iconSize: 18,
                onPressed: onPressed
              ),
            );
  }
}