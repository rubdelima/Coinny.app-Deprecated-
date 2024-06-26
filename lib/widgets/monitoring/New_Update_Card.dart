import 'package:flutter/material.dart';

class NewUpdateCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final Color color;

  const NewUpdateCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      height: 160,
      width: 352,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            child: Image.asset(icon, height: 160, width: 164, fit: BoxFit.cover),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  const SizedBox(height: 8), // Espaçamento entre o título e o subtítulo
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 10,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}