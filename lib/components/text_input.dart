import 'package:flutter/material.dart';

class CoinnyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;

  const CoinnyTextField(
      {required this.controller, this.isPassword = false, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64,
        child: TextField(
          controller: controller,
          style: const TextStyle(
              fontFamily: "Fieldwork-Geo",
              fontWeight: FontWeight.w400,
              color: Color(0xff5A5A5A),
              fontSize: 14),
          decoration: InputDecoration(
            labelStyle: const TextStyle(
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.w400,
                color: Color(0xff9A9A9A),
                fontSize: 14),
            labelText: isPassword ? "Senha" : 'Email',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(64)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),
              borderSide: const BorderSide(
                color: Color(0xff7A7FFF),
              ),
            ),
            contentPadding: const EdgeInsets.all(24.0), // Ajuste o padding conforme necessário
          ),
          keyboardType: isPassword ? null : TextInputType.emailAddress,
          obscureText: isPassword,
        ));
  }
}
