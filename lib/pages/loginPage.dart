import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learn/pages/parents/loginParenstPage.dart';
import 'package:learn/widgets/login/BoxSelectorLogin.dart';
import 'children/loginChildPage.dart';
import 'package:learn/components/gradient_button.dart';
import 'package:learn/widgets/login/loginAppBar.dart';
import 'package:learn/widgets/login/loginInfoContainter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userType = ''; 

  void _handleUserTypeChange(String type) {
    setState(() {
      userType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const LoginInfoContainer(
                title: "Bem-vindo\nà Coinny!",
                description:
                    "Para inicar sua sessão, selecione o seu tipo de perfil na Coinny!"),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CustomRadioTile(
                    isSelected: userType == 'responsável',
                    onTap: () => _handleUserTypeChange('responsável'),
                    title: 'Sou um\nresponsável',
                  ),
                  const SizedBox(width: 16), // Space between the options
                  CustomRadioTile(
                    isSelected: userType == 'aprendiz',
                    onTap: () => _handleUserTypeChange('aprendiz'),
                    title: 'Sou um\naprendiz',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 128),
            CoinnyGradientButton(
                onPressed: (userType == 'responsável' || userType == 'aprendiz') ? () {
                  if (userType == 'aprendiz') {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginChildPage(),
                      ),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginParentsPage(),
                      ),
                    );
                  }
                } :
                (){},
                title: "CONTINUAR",
                color: (userType == 'responsável' || userType == 'aprendiz') ? const Color(0xFF5D61D6) : const Color(0xFFD9D9D9),
            ),
            const SizedBox(height: 32),
            RichText(
              text: TextSpan(
                text: 'Ainda não é cadastrado? ',
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF060C20),
                  fontFamily: "Spartan",
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                    text: 'Cadastre-se',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/signUp');
                      },
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF5D61D6),
                    
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}