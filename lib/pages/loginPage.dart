import 'package:flutter/material.dart';
import 'package:learn/pages/parents/loginParenstPage.dart';
import 'package:learn/widgets/login/BoxSelectorLogin.dart';
import 'children/loginChildPage.dart';
import 'package:learn/widgets/login/loginEnterButton.dart';
import 'package:learn/widgets/login/loginAppBar.dart';
import 'package:learn/widgets/login/loginInfoContainter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userType = 'aprendiz'; 

  void _handleUserTypeChange(String type) {
    setState(() {
      userType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(54.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const LoginAppBar(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const LoginInfoContainer(
                      title: "Bem-vindo à Coinny",
                      description:
                          "Para inicar sua sessão, selecione o seu tipo de perfil Soldi"),
                  const SizedBox(height: 32),
                  CustomRadioTile(
                    isSelected: userType == 'aprendiz',
                    onTap: () => _handleUserTypeChange('aprendiz'),
                    title: 'Sou aprendiz',
                  ),
                  const SizedBox(height: 16), // Space between the options
                  CustomRadioTile(
                    isSelected: userType == 'responsavel',
                    onTap: () => _handleUserTypeChange('responsavel'),
                    title: 'Sou responsável',
                  ),
                  const SizedBox(height: 32),
                  LoginEnterButton(
                      onPressed: () {
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
                      },
                      title: "Continuar",
                      colors: const [Color(0xFF646AE3), Color(0xFF262B91)]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}