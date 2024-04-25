import 'package:flutter/material.dart';

class CoinnyText extends StatelessWidget{
  String text;
  final Color color ;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;

  CoinnyText({
    this.text = "", 
    this.color = const Color(0xFFFFFFFF),
    this.fontSize  = 12, 
    this.fontFamily  = "Fieldwork-Geo",
    this.fontWeight = FontWeight.normal
    });

    @override
    Widget build(BuildContext context) {
      return Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: fontFamily,
          fontWeight: fontWeight,
        ),
      );
    }
}