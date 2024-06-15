import 'package:flutter/material.dart';

class LoginInfoContainer extends StatelessWidget {
  final String title;
  final String description;

  const LoginInfoContainer({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            text: 'Bem-vindo\nà',
            style: TextStyle(
              fontSize: 32,
              color: Color(0xFF060C20),
              fontFamily: "Fieldwork-Geo",
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: ' Coinny',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),      
            ],
          ),
        ),
        const SizedBox(height: 24.0,),
        Text(
          description,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF060C20),
            fontFamily: "Fieldwork-Geo",
            fontWeight: FontWeight.w400,
          )
        ),
      ],
    );
  }
}