import 'package:flutter/material.dart';

class LoginEnterButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final List<Color> colors;
  final Color fontColor;

  LoginEnterButton({
    required this.onPressed,
    required this.title,
    this.colors = const [Color(0xFF646AE3), Color(0xFF262B91)],
    this.fontColor = const Color(0xFFFFFFFF)
  });

  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3)),
        ],
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors
                .transparent, // Background color (transparent)
            foregroundColor:
                Colors.transparent, // Splash color (transparent)
            shadowColor:
                Colors.transparent, // Shadow color (transparent)
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0, // No elevation
          ),
          onPressed: () {onPressed();},
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: fontColor,
              fontFamily: "Fieldwork-Geo"
            ),
          ))
    );
  }
}
