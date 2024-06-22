import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn/components/gradient_button.dart';
import 'package:learn/components/newBack_button.dart';
import 'package:learn/pages/children/codeRequestPage.dart';
import 'package:learn/pages/loginPage.dart';
import 'package:learn/pages/parents/signUpParents.dart';
import 'package:learn/widgets/login/loginInfoContainter.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFF1B1C43),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,          ),
          Align(
              alignment: Alignment.topLeft,
              child: CoinnyBackButton(
                  defaultIcon: false,
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginPage()));
                  }),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                const LoginInfoContainer(
                  title: "Como funciona o\ncadastro na Coinny?",
                  white: true,
                  description:
                  "Na Coinny, existem dois tipos de cadastro: Os responsáveis e os aprendizes\n\nSe o seu objetivo for acompanhar seus filhos ou parentes, continue o seu cadastro abaixo.",
                ),
                const SizedBox(height:54),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                  width: double.infinity,
                  height: 96,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF657D),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        text: 'Se o seu objetivo é ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'aprender sobre\neducação financeira',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: ', solicite um código de acesso ao seu responsável.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 44),
            child: Column(
              children: <Widget>[
                CoinnyGradientButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignParentsPage(),
                      ),
                    );
                  },
                  title: "Continuar",
                  color: const Color(0xFFFFFFFF),
                  fontColor: const Color(0xFF1B1C43),
                ),
                const SizedBox(height: 24),
                CoinnyGradientButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CodeRequestPage(),
                      ),
                    );
                  },
                  title: "Solicitar código",
                  color: Colors.transparent,
                  borderColor: const Color(0xFFFFFFFF),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}