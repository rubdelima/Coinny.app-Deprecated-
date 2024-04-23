import 'package:flutter/material.dart';

class StreakWidget extends StatelessWidget {
  final int streakDays;

  const StreakWidget({
    Key? key,
    required this.streakDays,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.63),
        border: Border.all(color: Colors.white, width: 1.0)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // To fit the content
        children: [
          Image.asset(
            'assets/images/appIcons/icon-steak.png', // Use the custom image
            color: Colors
                .white, // Apply a color filter if needed // Set your desired width
            height: 24, // Set your desired height
          ),
          const SizedBox(width: 8), // Spacing between icon and text
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Streak de ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: "$streakDays dias",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
