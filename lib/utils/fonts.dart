import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class CoinnyText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const CoinnyText(String this.text,
      {this.color = const Color(0xFFFFFFFF),
      this.fontSize = 12,
      this.fontFamily = "Fieldwork-Geo",
      this.fontWeight = FontWeight.normal,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}

@immutable
class CoinnyTitle extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const CoinnyTitle(String this.text,
      {this.color = const Color(0xFF000000),
      this.fontSize = 12,
      this.fontWeight = FontWeight.w600,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: textAlign,
        style: GoogleFonts.rubik(
          textStyle: TextStyle(color: Color(0xFF000000), letterSpacing: .5),
          fontSize: fontSize,
          fontWeight: fontWeight,
        ));
  }
}
