import 'package:flutter/material.dart';
import 'package:learn/utils.dart';

class LoginTitle extends StatelessWidget {
  final String title;
  final String description;
  final TextAlign? textAlign;
  final CrossAxisAlignment crossAxisAlignment;

  const LoginTitle({
    Key? key,
    required this.title,
    required this.description,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        CoinnyTitle(
          title,
          textAlign: textAlign,
          color: const Color(0x00000000),
          fontSize: 32,
        ),
        const SizedBox(
          height: 24,
        ),
        CoinnyText(
          description,
          textAlign: textAlign,
          color: const Color(0xff2C2C2C),
          fontSize: 16,
        ),
      ],
    );
  }
}
