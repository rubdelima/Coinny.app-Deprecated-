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

class RequestInputFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController relationshipController;

  const RequestInputFields({
    super.key,
    required this.emailController,
    required this.relationshipController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        RelationshipField(controller: relationshipController),
      ],
    );
  }
}

class RelationshipField extends StatefulWidget {
  final TextEditingController controller;

  const RelationshipField({super.key, required this.controller});

  @override
  _RelationshipFieldState createState() => _RelationshipFieldState();
}

class _RelationshipFieldState extends State<RelationshipField> {
  void _showRelationshipDialog() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Selecione o parentesco',
                  style: TextStyle(fontSize: 16.0)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  _buildOption('Pai/Mãe'),
                  _buildOption('Tio/Tia'),
                  _buildOption('Avô/Avó'),
                  _buildOption('Outro'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOption(String title) {
    return GestureDetector(
      onTap: () {
        widget.controller.text = title;
        Navigator.pop(context);
      },
      child: Chip(
        label: Text(title),
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: TextField(
        controller: widget.controller,
        readOnly: true,
        style: const TextStyle(
          fontFamily: "Fieldwork-Geo",
          fontWeight: FontWeight.w400,
          color: Color(0xffffffff),
          fontSize: 14,
        ),
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            fontFamily: "Fieldwork-Geo",
            fontWeight: FontWeight.w400,
            color: Color(0xffCDCDCD),
            fontSize: 14,
          ),
          labelText: 'Parentesco',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(46),
          ),
          suffixIcon: IconButton(
            icon: Image.asset('assets/images/appIcons/right_arrow.png'),
            onPressed: _showRelationshipDialog,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}

class CodeRequestPage extends StatefulWidget {
  const CodeRequestPage({super.key});

  @override
  _CodeRequestPageState createState() => _CodeRequestPageState();
}

class _CodeRequestPageState extends State<CodeRequestPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _relationshipController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _relationshipController.dispose();
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
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
                      title: "Insira o e-mail do\nseu responsável",
                      white: true,
                      description:
                          "Iremos enviar um e-mail de solicitação de acesso para o seu responsável."),
                  const SizedBox(height: 48),
                  RequestInputFields(
                      emailController: _emailController,
                      relationshipController: _relationshipController),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 44),
              child: CoinnyGradientButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginParentsPage(),
                    ),
                  );
                },
                title: "CONTINUAR",
                color: const Color(0xFFFFFFFF),
                fontColor: const Color(0xFF1B1C43),
              ),
            )
          ]),
    );
  }
}
