import 'package:flutter/material.dart';

class NumberBlock extends StatelessWidget {
  final int number;
  final List<TextSpan> text;
  const NumberBlock({required this.number, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xFF4B50C0),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            "$number",
            style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 16,
                fontFamily: "Fieldwork-Geo"),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width - 96,
          child: RichText(
              text: TextSpan(
                  children: text,
                  style: const TextStyle(
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: "Fieldwork-Geo")),
              textAlign: TextAlign.justify),
        ),
      ],
    );
  }
}
