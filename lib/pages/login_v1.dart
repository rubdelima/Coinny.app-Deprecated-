import 'package:flutter/material.dart';
import 'package:learn/pages/children/login_v1.dart';
import 'package:learn/pages/parents/login_v1.dart';
import 'package:learn/components.dart';
import 'package:learn/utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userType = 'responsavel';

  void _handleUserTypeChange(String type) {
    setState(() {
      userType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const LoginTitle(
                    title: "Bem-vindo à Coinny!",
                    description:
                        "Para inicar sua sessão, selecione o seu tipo de perfil na Coinny!",
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      ProfileSelector(
                          profileType: "responsavel",
                          isSelected: userType == 'responsavel',
                          onTap: () => _handleUserTypeChange('responsavel')
                      ),
                      const SizedBox(width: 20,),
                      ProfileSelector(
                          profileType: "aprendiz",
                          isSelected: userType == 'aprendiz',
                          onTap: () => _handleUserTypeChange('aprendiz'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 54),
                  CoinnyGradientButton(
                    width: MediaQuery.sizeOf(context).width-32,
                    height: 54,
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => userType == 'aprendiz'
                                ? LoginChildPage()
                                : LoginParentsPage(),
                          ),
                        );
                      },
                      title: "Continuar",
                      colors:  [
                        Theme.of(context).primaryColor.withOpacity(0.7), 
                        Theme.of(context).primaryColor
                      ]),
                      const SizedBox(height: 54),
                      InkWell(
                        onTap: () {},
                        child: CoinnyText(
                          "Ainda não tenho uma conta",
                            color: Theme.of(context).primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                      )
                      )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
