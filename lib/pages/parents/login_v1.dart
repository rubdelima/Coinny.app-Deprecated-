import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn/components.dart';
import "package:learn/utils.dart";

class LoginParentsPage extends StatefulWidget {
  @override
  _LoginParentsPageState createState() => _LoginParentsPageState();
}

class _LoginParentsPageState extends State<LoginParentsPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      User? parent = credential.user;

      if (parent != null) {
        Parents parentUser = await loadParent(parent.email ?? "");
        savePersonToken(parentUser.email);
        Navigator.pushReplacementNamed(context, '/parentsMain',
            arguments: parentUser);
      }
    
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print('the error is $e');
      }
      rethrow;
    } on Exception catch (e) {
      String error = e.toString();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'As credenciais informadas não são válidas, tente novamente $error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const LoginTitle(
                      title: "Seja bem-vindo de volta!",
                      description:
                          "Insira suas credenciais para\nacessar o aplicativo da Coinny."),
                  const SizedBox(height: 40),
                  Column(
                    crossAxisAlignment:     CrossAxisAlignment.end,
                    children: [
                      CoinnyTextField(
                        controller: _emailController,
                      ),
                      const SizedBox(height: 16),
                      CoinnyTextField(
                        controller: _passwordController,
                        isPassword: true,
                      ),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: () {},
                        child: CoinnyText(
                          "Esqueci minha conta",
                            color: Theme.of(context).primaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                      )
                      )
                    ],
                  ),
                  const SizedBox(height: 54),
                  CoinnyGradientButton(
                    onPressed: login,
                    width: MediaQuery.sizeOf(context).width-32,
                    height: 54,
                    title: "Entrar",
                    colors:  [
                        Theme.of(context).primaryColor.withOpacity(0.7), 
                        Theme.of(context).primaryColor
                      ]
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
