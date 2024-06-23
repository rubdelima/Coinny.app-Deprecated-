import 'package:flutter/material.dart';

class NewBackButton extends StatelessWidget {
  const NewBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => Navigator.pop(context),
        child: Container(
            padding: const EdgeInsets.all(16),
            child: Image.asset(
              "assets/images/appIcons/left-arrow.png",
              height: 16,
            )));
  }
}