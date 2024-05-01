import 'package:flutter/material.dart';

class PerformanceReportWidget extends StatelessWidget {
  const PerformanceReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Relatório de desempenho",
          style: TextStyle(
              fontFamily: "Fieldwork-Geo",
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
        const Text(
          "Gere um relatório de desempenho de todos os seus dependentes.",
          style: TextStyle(
              fontFamily: "Fieldwork-Geo",
              color: Color(0xFF5c5c5c),
              fontSize: 12),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
            height: 120,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: const Color(0xFFA2A2A2).withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF5C5C5C).withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(1, 1),
                  )
                ]),
            child: Center(
                child: Image.asset(
                    "assets/images/appIcons/icon-lock-default.png",
                    height: 119 * 0.25))),
      ],
    );
  }
}
