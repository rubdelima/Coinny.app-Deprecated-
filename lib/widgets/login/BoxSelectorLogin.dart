import 'package:flutter/material.dart';

class CustomRadioTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioTile({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.91, vertical: 12),
        decoration: BoxDecoration(
          color:
              isSelected ? const Color.fromARGB(255, 255, 255, 255) : Colors.white, // Highlight color
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isSelected ? const Color(0xFF5B61D7) : const Color(0xFFB6B6B6), // Highlight color
            width: 0.75,
          ),
          boxShadow: [
            BoxShadow(
              color:  Colors.grey.withOpacity(isSelected ? 0.3 : 0.01),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            isSelected ? const Icon(Icons.check_circle, color:  Color(0xFF5B61D7)) :
                         const Icon(Icons.radio_button_unchecked, color: Color(0xFFB6B6B6)),
            const SizedBox(width: 18.2),
            Expanded(
              child: Text(
                title, 
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400,
                  color: isSelected ? const Color(0xFF3C3C3C) : const Color(0xFFB6B6B6)
                  )
                )
              ),
              
          ],
        ),
      ),
    );
  }
}
