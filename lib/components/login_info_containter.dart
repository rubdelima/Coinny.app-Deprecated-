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
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            color: Color(0xFF4349B8),
            fontFamily: "Fieldwork-Geo",
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 24.0,),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF5F5F5F),
            fontFamily: "Fieldwork-Geo",
            fontWeight: FontWeight.w400,
          )
        ),
      ],
    );
  }
}