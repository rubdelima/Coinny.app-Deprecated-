import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:learn/components/gradient_button.dart';
import 'package:learn/components/newBack_button.dart';
import 'package:learn/pages/loginPage.dart';
import 'package:learn/pages/parents/loginParenstPage.dart';
import 'package:learn/widgets/login/loginAppBar.dart';
import 'package:learn/widgets/login/loginInfoContainter.dart';

class LoginInputFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController dateController;

  const LoginInputFields({
    Key? key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.dateController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _dateFormat = TextEditingController();
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
                  fontSize: 14),
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w400,
                    color: Color(0xffCDCDCD),
                    fontSize: 14),
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
                  fontSize: 14),
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w400,
                    color: Color(0xffCDCDCD),
                    fontSize: 14),
                labelText: 'E-mail',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(46)),
              ),
              keyboardType: TextInputType.emailAddress,
            )),
        const SizedBox(height: 16),
        SignUpStatefulFields(
          passwordController: passwordController,
          dateController: dateController,
        ),
      ],
    );
  }
}

class SignUpStatefulFields extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController dateController;

  const SignUpStatefulFields({
    super.key,
    required this.passwordController,
    required this.dateController,
  });

  @override
  _SignUpStatefulFieldsState createState() => _SignUpStatefulFieldsState();
}

class _SignUpStatefulFieldsState extends State<SignUpStatefulFields> {
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 54,
          child: TextField(
            controller: widget.passwordController,
            style: const TextStyle(
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.w400,
                color: Color(0xffffffff),
                fontSize: 14),
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400,
                  color: Color(0xffCDCDCD),
                  fontSize: 14),
              labelText: 'Senha',
              suffixIcon: widget.passwordController.text.isNotEmpty
                  ? IconButton(
                      padding: const EdgeInsets.only(right: 16),
                      icon: obscureText
                          ? Image.asset(
                              'assets/images/appIcons/password_eye.png',
                              color: const Color(0xffffffff))
                          : Image.asset(
                              'assets/images/appIcons/password_eye_off.png',
                              color: const Color(0xffffffff)),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    )
                  : null,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(46)),
            ),
            obscureText: obscureText,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 54,
          child: TextField(
            controller: widget.dateController,
            style: const TextStyle(
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.w400,
                color: Color(0xffffffff),
                fontSize: 14),
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400,
                  color: Color(0xffCDCDCD),
                  fontSize: 14),
              labelText: 'Data de Nascimento',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(46)),
              suffixIcon: IconButton(
                padding: const EdgeInsets.only(right: 16),
                icon: Image.asset('assets/images/appIcons/date_calendar.png',
                    color: const Color(0xFFFFFFFF)),
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      widget.dateController.text =
                          dateFormat.format(pickedDate);
                    });
                  }
                },
              ),
            ),
            keyboardType: TextInputType.datetime,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^[0-9/]*$')),
            ],
            onChanged: (value) {
              if (value.length == 10) {
                try {
                  DateTime parsedDate = dateFormat.parse(value);
                  print(parsedDate); // Data válida
                } catch (e) {
                  print("Data inválida"); // Data inválida
                }
              }
            },
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
  final TextEditingController _dateController = TextEditingController();

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
          'dependents': ["1111"]
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
      backgroundColor: const Color(0xFF1B1C43),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  const LoginInfoContainer(
                      title: "Cadastre-se\nna Coinny!",
                      white: true,
                      description:
                          "Insira suas credenciais abaixo para finalizar o seu cadastro."),
                  const SizedBox(height: 48),
                  LoginInputFields(
                    emailController: _emailController,
                    passwordController: _passwordController,
                    nameController: _nameController,
                    dateController: _dateController,
                  ),
                  const SizedBox(height: 32),
                  CoinnyGradientButton(
                    onPressed: () {
                      signUpWithFirebase();
                    },
                    title: "CADASTRAR",
                    color: const Color(0xFFFFFFFF),
                    fontColor: const Color(0xFF1B1C43),
                  ),
                  // Add a button for signing up, calling signUpWithFirebase
                ],
              ),
            ),
          ]),
    );
  }
}
