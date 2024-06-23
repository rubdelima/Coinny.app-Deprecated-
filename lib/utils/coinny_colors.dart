import 'package:flutter/material.dart';

class ComponentsColors {
  LinearGradient lockCard = const LinearGradient(
      colors: [Color(0xFF878787),Color(0xFF313131) ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  LinearGradient teste = const LinearGradient(
      colors: [Color(0xFF1C296B),Color(0xFF59E7D6) ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  LinearGradient blueCard = const LinearGradient(
      colors: [Color(0xFF7A7FFF),Color(0xFF373CA7), Color(0xFF040862) ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  LinearGradient greenCard = const LinearGradient(
      colors: [Color(0xFF1290A2),Color(0xFF82DA59) ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  LinearGradient activities = const LinearGradient(
      colors: [Color(0xFF7A7FFF),Color(0xFF040862) ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  LinearGradient conquist = const LinearGradient(
      colors: [Color(0xFF2F12A2),Color(0xFFDA59AE) ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  LinearGradient button = const LinearGradient(
      colors: [Color(0xFF646AE3),Color(0xFF262B91) ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  LinearGradient card = const LinearGradient(
      colors: [Color(0xFF1E12A2),Color(0xFF59CBDA) ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  LinearGradient yellowCard = const LinearGradient(
      colors: [Color(0xFFA24E12),Color(0xFFF9DA6F) ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  LinearGradient ligthBlue = const LinearGradient(
      colors: [Color(0xFF1277A2),Color(0xFF59DAA4) ], begin: Alignment.topLeft, end: Alignment.bottomRight);
  
  LinearGradient red = const LinearGradient(
      colors: [Color(0xFF910B0B),Color(0xFFDA5959) ], begin: Alignment.topLeft, end: Alignment.bottomRight);

  LinearGradient ligthCyan = const LinearGradient(
      colors: [Color(0xFF59D2DA),Color(0xFF1232A2) ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}

class CoinnyColors{
  
  // Purple Scale
  static const Color textDarkPurple = Color(0xFF060C20);
  static const Color mainPurple = Color(0xFF5D61D6);
  static const Color softPurple = Color(0xFF9C9FFB);
// Grey Scale
  static const Color absoluteBlack = Color(0xFF030303);
  static const Color suportTextGrey = Color(0xFF474747);
  static const Color darkGrey = Color(0xFF626262);
  static const Color mediumGrey = Color(0xFFD9D9D9);
  static const Color absoluteWhite = Color(0xFFFFFFFF);

  // Error Scale
  static const Color errorSoftRed = Color(0xFFFFDAE0);
  static const Color errorMediumRed = Color(0xFFFDC0C2);
  static const Color errorStrongRed = Color(0xFFFF7460);

  // Success Scale
  static const Color successSoftGreen = Color(0xFFC2FDD6);
  static const Color successMediumGreen = Color(0xFF90FFC3);
  static const Color successStrongGreen = Color(0xFF5ED695);

  // Warning Scale
  static const Color warningSoftYellow = Color(0xFFFFFCE2);
  static const Color warningMediumYellow = Color(0xFFFEE892);
  static const Color warningStrongYellow = Color(0xFFFFE061);

  // Pink Scale
  static const Color softPink = Color(0xFFFDA7A0);
  static const Color mainPink = Color(0xFFF95757);
  static const Color strongPink = Color(0xFFF74660);
}