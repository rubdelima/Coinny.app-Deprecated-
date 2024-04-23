import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn/widgets/login/loginEnterButton.dart';
import 'package:learn/widgets/login/loginAppBar.dart';
import 'package:learn/widgets/login/loginInfoContainter.dart';

class LoginInputFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginInputFields({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 48,
            child: TextField(
              controller: emailController,
              style: const TextStyle(
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400,
                  color: Color(0xff5A5A5A),
                  fontSize: 12),
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w400,
                    color: Color(0xff9A9A9A),
                    fontSize: 12),
                labelText: 'Email',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xff7A7FFF),
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            )),
        const SizedBox(height: 16),
        SizedBox(
          height: 48,
          child: TextField(
            controller: passwordController,
            style: const TextStyle(
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.w400,
                color: Color(0xff5A5A5A),
                fontSize: 12),
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9A9A9A),
                  fontSize: 12),
              labelText: 'Senha',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xff7A7FFF),
                ),
              ),
            ),
            obscureText: true,
          ),
        )
      ],
    );
  }
}

class SignParentsPage extends StatefulWidget {
  @override
  _SignParentsPageState createState() => _SignParentsPageState();
}

class _SignParentsPageState extends State<SignParentsPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithFirebase() async {
    // Your existing signInWithFirebase function remains unchanged.
  }

  // New signup function
  Future<void> signUpWithFirebase() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      
      Navigator.pushReplacementNamed(context, '/parentsMain');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('An account already exists for that email.');
      } else {
        print('The error is $e');
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(children: <Widget>[
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
                      "Para iniciar sua sessão, insira suas credenciais de login."),
              const SizedBox(height: 32),
              LoginInputFields(
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              const SizedBox(height: 32),
              LoginEnterButton(
                onPressed: () {
                  signUpWithFirebase();
                },
                title: "Cadastrar",
                colors: const [Color(0xFF646AE3), Color(0xFF262B91)],
              ),
              // Add a button for signing up, calling signUpWithFirebase
            ],
          ),
        ),
      ]),
    ));
  }
}
