import 'package:flutter/material.dart';
import 'package:learn/utils/fontstyles.dart';

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
            style: white? FontStyles.h2SemiBoldWhite : FontStyles.h1BoldBlack,
          ),
        ),
        const SizedBox(height: 24.0,),
        Text(
          description,
          textAlign: TextAlign.left,
          style: white? FontStyles.body1MediumWhite : FontStyles.body1MediumBlack
        ),
      ],
    );
  }
}