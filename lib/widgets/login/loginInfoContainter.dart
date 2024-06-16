import 'package:flutter/material.dart';

class LoginInfoContainer extends StatelessWidget {
  final String title;
  final String boldTitle;
  final String description;
  final bool bold1;

  const LoginInfoContainer({
    required this.title,
    required this.boldTitle,
    required this.description,
    this.bold1 = false,
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
              color: bold1 ? const Color(0xFFFFFFFF): const Color(0xFF060C20),
              fontFamily: "Fieldwork-Geo",
              fontWeight: bold1 ? FontWeight.w900: FontWeight.w600,
            ),
            children: [
              TextSpan(
                text: boldTitle,
                style: TextStyle(
                  fontWeight: bold1 ? FontWeight.w600 : FontWeight.w900,
                ),
              ),      
            ],
          ),
        ),
        const SizedBox(height: 24.0,),
        Text(
          description,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            color: bold1 ? const Color(0xFFFFFFFF): const Color(0xFF060C20),
            fontFamily: "Fieldwork-Geo",
            fontWeight: FontWeight.w400,
          )
        ),
      ],
    );
  }
}