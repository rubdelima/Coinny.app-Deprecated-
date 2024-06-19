import 'package:flutter/material.dart';

class CoinnyGradientButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;
  final Color fontColor;
  final Color? borderColor;

  CoinnyGradientButton({
    required this.onPressed,
    required this.title,
    this.color = const Color(0xFF5D61D6),
    this.fontColor = const Color(0xFFFFFFFF),
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color? effectiveBorderColor = borderColor;
    return Container(
        width: 358,
        height: 54,
        decoration: BoxDecoration(
          border: (effectiveBorderColor == null)
              ? null
              : Border.all(
                  color: effectiveBorderColor,
                  width: 2,
                ),
          borderRadius: BorderRadius.circular(30),
          color: color,
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
              backgroundColor:
                  Colors.transparent, // Background color (transparent)
              foregroundColor: Colors.transparent, // Splash color (transparent)
              shadowColor: Colors.transparent, // Shadow color (transparent)
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0, // No elevation
            ),
            onPressed: () {
              onPressed();
            },
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: fontColor,
                  fontFamily: "Fieldwork-Geo"),
            )));
  }
}
