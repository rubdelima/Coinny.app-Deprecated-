import 'package:flutter/material.dart';
import 'package:learn/classes.dart';
import 'package:learn/utils.dart';

class StreakWidget extends StatelessWidget {
  final Children child;

  const StreakWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.63),
          border: Border.all(color: Colors.white, width: 1.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/appIcons/icon-steak.png',
            color: Colors.white,
            height: 24,
          ),
          const SizedBox(width: 8),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Streak de ',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: "${diffDays(child.lastAccsess ?? DateTime.now())} dias",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: "Fieldwork-Geo",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
