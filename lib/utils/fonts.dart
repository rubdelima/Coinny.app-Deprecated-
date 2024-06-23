import 'package:flutter/material.dart';

class CoinnyText extends StatelessWidget {
  String text;
  final Color color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;

  CoinnyText(String this.text,
      {this.color = const Color(0xFFFFFFFF),
      this.fontSize = 12,
      this.fontFamily = "Fieldwork-Geo",
      this.fontWeight = FontWeight.normal});

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

class CoinnyTextStyles {
  static TextStyle h1_bold({
    Color? color,
    double fontSize = 32,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w700);
  }

  static TextStyle h2_bold({
    Color? color,
    double fontSize = 30,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w700);
  }

  static TextStyle h2_semi_bold({
    Color? color,
    double fontSize = 30,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w600);
  }

  static TextStyle h2_medium({
    Color? color,
    double fontSize = 30,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w400);
  }

  static TextStyle h3_bold({
    Color? color,
    double fontSize = 28,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w700);
  }

  static TextStyle h3_semi_bold({
    Color? color,
    double fontSize = 28,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w600);
  }

  static TextStyle h4_bold({
    Color? color,
    double fontSize = 20,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w700);
  }

  static TextStyle h5_semi_bold({
    Color? color,
    double fontSize = 18,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w600);
  }

  static TextStyle h5_medium({
    Color? color,
    double fontSize = 18,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w500);
  }

  static TextStyle body_1_medium({
    Color? color,
    double fontSize = 16,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w500);
  }

  static TextStyle body_1_regular({
    Color? color,
    double fontSize = 16,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w400);
  }

  static TextStyle body_2_medium({
    Color? color,
    double fontSize = 14,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w500);
  }

  static TextStyle body_3_semi_bold({
    Color? color,
    double fontSize = 12,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w600);
  }

  static TextStyle body_3_medium({
    Color? color,
    double fontSize = 12,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w500);
  }

  static TextStyle footone_1_medium({
    Color? color,
    double fontSize = 10,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w500);
  }

  static TextStyle footone_1_semi_bold({
    Color? color,
    double fontSize = 10,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w600);
  }

  static TextStyle footone_1_bold({
    Color? color,
    double fontSize = 10,
  }) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: FontWeight.w600);
  }

  static TextStyle personalized(
      {Color? color,
      double fontSize = 12,
      FontWeight fontWeigth = FontWeight.w400}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: "Spartan",
        fontWeight: fontWeigth);
  }
}
