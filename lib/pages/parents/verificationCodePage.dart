import 'package:flutter/material.dart';
import 'package:learn/widgets/login/loginEnterButton.dart';
import 'package:learn/widgets/global/boxedNumber.dart';

class VerificationCodePage extends StatelessWidget {
  final String childrenName;
  final List<int> childrenCode; // Change this line
  const VerificationCodePage(
      {required this.childrenName, required this.childrenCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/appIcons/check-circle.png",
            width: 120,
          ),
          const SizedBox(height: 24),
          const Text("Conta criada com sucesso!",
              style: TextStyle(
                  color: Color(0xFF4349B8),
                  fontFamily: "Fieldwork-Geo",
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                        text:
                            "O código abaixo deverá ser utilizado por $childrenName ao entrar na Coinny, lembre de guardar esta chave!")
                  ],
                  style: const TextStyle(
                      color: Color(0xFF5F5F5F),
                      fontFamily: "Fieldwork-Geo",
                      fontSize: 15.5,
                      fontWeight: FontWeight.w500)),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: childrenCode.map((e) => BoxedNumber(e)).toList(),
          ),
          const SizedBox(height: 64),
          LoginEnterButton(
            title: "Voltar ao início",
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
          )
        ],
      )),
    );
  }
}
