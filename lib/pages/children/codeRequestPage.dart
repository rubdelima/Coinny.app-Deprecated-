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
import 'package:learn/utils/fontstyles.dart';
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
        const SizedBox(height: 24),
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
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
          decoration: const BoxDecoration(
            color: Color(0xFFFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(24.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset('assets/images/appIcons/popup_slider.png'),
              ),
              const SizedBox(height: 54),
              const Text('Selecione o\nparentesco',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Spartan',
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF060C20))),
              const SizedBox(height: 32),
              Wrap(
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  _buildOption('Pai/Mãe'),
                  _buildOption('Tio/Tia'),
                  _buildOption('Avô/Avó'),
                  _buildOption('Outro'),
                ],
              ),
              const SizedBox(height: 54),
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
      child: Container(
        height: 64,
        width: (title == 'Outro')? 92 : 140,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: const Color(0xFF060C20)),
        ),
        child: Center(
          child: Text(
            title,
            style: FontStyles.body2MediumBlack
          ),
        ),
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
          fontFamily: "Spartan",
          fontWeight: FontWeight.w400,
          color: Color(0xffffffff),
          fontSize: 14,
        ),
        decoration: InputDecoration(
          labelStyle: const TextStyle(
            fontFamily: "Spartan",
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
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CoinnyBackButton(
                    color: const Color(0xFFFFFFFF),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
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
                  title: "ENVIAR",
                  color: const Color(0xFFFFFFFF),
                  fontColor: const Color(0xFF1B1C43),
                ),
              )
            ]),
      ),
    );
  }
}
