import 'package:flutter/material.dart';


class QuestionRadioTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final bool isCorrect;
  final VoidCallback onTap;
  final LayerLink link;
  final String? balloonPath;

  const QuestionRadioTile({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.isCorrect,
    required this.onTap,
    required this.link,
    this.balloonPath
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine the background and border color based on the selection and correctness.
    Color backgroundColor = Colors.transparent;
    Color borderColor = const Color(0xFFB6B6B6);
    Color checkIconColor = const Color(0xFFB6B6B6);

    if (isSelected) {
      borderColor = isCorrect
          ? Colors.green
          : const Color(0xFFFFA200); // Green for correct, orange for incorrect.
      backgroundColor = Colors.transparent; // No border when selected.
      checkIconColor = isCorrect ? Colors.green
          : const Color(0xFFFFA200); // White checkmark when selected.
    }

    return CompositedTransformTarget(
      link: link,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          height: 0.1*(MediaQuery.of(context).size.height),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: borderColor, width: 0.75),
          ),
          child: Row(
            children: [
              isSelected
                  ? Icon(Icons.check_circle, color: checkIconColor)
                  : const Icon(Icons.radio_button_unchecked,
                      color: Color(0xFFB6B6B6)),
              const SizedBox(width: 18.2),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w400,
                    color: isSelected ? Colors.white : const Color(0xFFB6B6B6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}