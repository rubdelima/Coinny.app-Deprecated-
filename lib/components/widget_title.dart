import 'package:flutter/material.dart';

class CoinnyWidgetTitle extends StatelessWidget {
  final String title;
  final String description;

  const CoinnyWidgetTitle(
      {required this.title, required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: Color(0xFF222222),
              fontSize: 14,
              fontFamily: "Fieldwork-Geo",
              fontWeight: FontWeight.w600,
            ),
          ),
          const WidgetSpan(
            child: SizedBox(height: 16.0),
          ),
          TextSpan(
            text: description,
            style: const TextStyle(
              color: Color(0xFF5C5C5C),
              fontSize: 12,
              fontFamily: "Fieldwork-Geo",
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
