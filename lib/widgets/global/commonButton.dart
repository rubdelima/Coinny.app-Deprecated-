import 'package:flutter/material.dart';

class LearnButton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final Text text;
  final Color buttonColor;
  final Color textColor;
  final Color shadowColor;
  final Color borderColor;
  final Function? onPressed;

  const LearnButton(
      {required this.text,
      this.height = 40,
      this.width = 185,
      this.borderRadius = 46,
      this.buttonColor = Colors.white,
      this.textColor = Colors.transparent,
      this.shadowColor = Colors.transparent,
      this.borderColor = Colors.white,
      this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {

    return 
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(borderRadius)
        ),
      child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shadowColor: shadowColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
              color: borderColor, width: 1),
        ),
        padding: const EdgeInsets.symmetric(
            horizontal: 4, vertical: 4),
      ),
      onPressed: (){onPressed!();},
      child: text,
    )
    );
  }
}
