import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learn/components/gradient_button.dart';
import 'package:learn/widgets/login/loginAppBar.dart';
import 'package:learn/widgets/login/loginInfoContainter.dart';

class LoginInputFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;

  const LoginInputFields({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 54,
          child: TextField(
            controller: nameController,
            style: const TextStyle(
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.w400,
                color: Color(0xffffffff),
                fontSize: 12),
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400,
                  color: Color(0xffCDCDCD),
                  fontSize: 12),
              labelText: 'Nome',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(46)),
            ),
            keyboardType: TextInputType.emailAddress,
          )),
        const SizedBox(height: 16),
        SizedBox(
            height: 54,
            child: TextField(
              controller: emailController,
              style: const TextStyle(
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400,
                  color: Color(0xffffffff),
                  fontSize: 12),
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w400,
                    color: Color(0xffCDCDCD),
                    fontSize: 12),
                labelText: 'E-mail',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(46)),
              ),
              keyboardType: TextInputType.emailAddress,
            )),
        const SizedBox(height: 16),
        SizedBox(
          height: 54,
          child: TextField(
            controller: passwordController,
            style: const TextStyle(
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.w400,
                color: Color(0xffffffff),
                fontSize: 12),
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400,
                  color: Color(0xffCDCDCD),
                  fontSize: 12),
              labelText: 'Senha',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(46)),
            ),
            obscureText: true,
          ),
        ),
        
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
  final TextEditingController _nameController = TextEditingController();

  Future<void> signUpWithFirebase() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (credential.user != null) {
        String defaultName = _nameController.text.isEmpty
            ? "Default Name"
            : _nameController.text; 
        String defaultPhotoPath =
            "assets/images/appImages/joana-dias.png"; // imagem padrao

        await FirebaseFirestore.instance
            .collection('parent')
            .doc(credential.user!.email)
            .set({
          'name': defaultName,
          'photoPath': defaultPhotoPath,
          'dependents':
              ["1111"]
        });

        Navigator.pushReplacementNamed(context, '/login');
      }
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
      backgroundColor: const Color(0xFF1A1D78),
      body: Padding(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              const LoginInfoContainer(
                  title: "Cadastre-se\n",
                  bold1: true,
                  boldTitle: "na Coinny!",
                  description:
                      "Insira suas credenciais abaixo para finalizar o seu cadastro."),
              const SizedBox(height: 48),
              LoginInputFields(
                emailController: _emailController,
                passwordController: _passwordController,
                nameController: _nameController,
              ),
              const SizedBox(height: 32),
              CoinnyGradientButton(
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
