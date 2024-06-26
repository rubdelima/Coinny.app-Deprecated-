import 'package:flutter/material.dart';
import 'package:learn/classes.dart';
import 'package:learn/components/streak.dart';

class UserPhotoAndName extends StatelessWidget {
  final Person person;
  final bool isSugestion;
  final bool logout;

  const UserPhotoAndName({
    required this.person,
    this.isSugestion = false,
    this.logout = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Children? child = person is Children ? person as Children : null;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(person.photoPath, height: 60),
        ),
        const SizedBox(width: 8),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: isSugestion ? person.name : "Bom dia, ",
                style: TextStyle(
                  fontSize: isSugestion ? 18 : 14,
                  fontWeight: isSugestion ? FontWeight.bold : FontWeight.w500,
                ),
              ),
              TextSpan(
                text: isSugestion
                    ? "${child!.getLevel()} ${child.getClass()}"
                    : person.name,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSugestion ? FontWeight.normal : FontWeight.w700,
                ),
              ),
            ],
            style: TextStyle(
              color: isSugestion ? const Color(0xFF0D116E) : const Color(0xFF060C20),
              fontFamily: "Spartan",
            ),
          ),
        ),
        const Spacer(),
        person is Children ?
            isSugestion
                ? child!.getShield()
                : StreakWidget(child: person as Children)
              : const SizedBox(),
        if(logout)
          IconButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, '/login'),
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ))
      ],
    );
  }
}
