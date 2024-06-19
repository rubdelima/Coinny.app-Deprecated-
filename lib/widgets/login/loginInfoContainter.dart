import 'package:flutter/material.dart';

class LoginInfoContainer extends StatelessWidget {
  final String title;
  final String description;
  final bool white;

  const LoginInfoContainer({
    required this.title,
    required this.description,
    this.white = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: title,
            style: TextStyle(
              fontSize: 32,
              color: white ? const Color(0xFFFFFFFF): const Color(0xFF060C20),
              fontFamily: "Fieldwork-Geo",
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 24.0,),
        Text(
          description,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            color: white ? const Color(0xFFFFFFFF): const Color(0xFF060C20),
            fontFamily: "Fieldwork-Geo",
            fontWeight: FontWeight.w400,
          )
        ),
      ],
    );
  }
}