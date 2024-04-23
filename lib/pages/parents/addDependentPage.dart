import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import '../../widgets/settings/selectedGoals.dart';
import '../../widgets/settings/childrenDataBox.dart';
import 'package:learn/widgets/login/loginEnterButton.dart';
import 'package:learn/pages/parents/verificationCodePage.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AddDependentPage extends StatefulWidget {
  final Children? children;

  AddDependentPage({
    this.children,
  });

  @override
  _AddDependentPageState createState() => _AddDependentPageState();
}

class _AddDependentPageState extends State<AddDependentPage> {
  final TextEditingController _nomeCriancaController = TextEditingController();
  final TextEditingController _dataNascimentoController =
      TextEditingController();
  List<String> _conteudosSelecionados = [];
  final List<String> _conteudosDisponiveis = [
    "Conteúdos básicos",
    "Finanças",
    "Investimentos",
    "Juros",
    "Poupança"
  ];

  @override
  void initState() {
    super.initState();
    if (widget.children != null) {
      _nomeCriancaController.text = widget.children!.name;
      _dataNascimentoController.text =
          DateFormat('dd/MM/yyyy').format(widget.children!.birthdate);
      _conteudosSelecionados = widget.children!.goals;
    }
  }

  @override
  Widget build(BuildContext context) {
    void _saveDependent() async {
      String nome = _nomeCriancaController.text;
      String aniversario = _dataNascimentoController.text;
      String responsavel =
          FirebaseAuth.instance.currentUser?.email ?? "No email";

      List<Map<String, dynamic>> metas = _conteudosSelecionados
          .map((goal) => {
                'nome': goal,
                'createdAt': Timestamp.now(),
              })
          .toList();

      var rng = Random();
      List<int> childrenCode = List<int>.generate(4, (_) => rng.nextInt(10));

      Map<String, dynamic> novoDependente = {
        'name': nome,
        'birthdate': aniversario,
        'responsavel': responsavel,
        'metas': metas,
        'childrenCode': childrenCode,
        'acheivments' : [],
        'activities' : const ["", ""],
        'xpPerDay' : []
      };

      try {
        await FirebaseFirestore.instance
            .collection('dependentes')
            .add(novoDependente)
            .then((value) => print(value));
      } catch (e) {
        print(e);
      }

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerificationCodePage(
                    childrenName: nome,
                    childrenCode: childrenCode,
                  )));
    }

    return Scaffold(
      appBar: LearnAppBar(
        heigth: 180,
        backButtonFunction: () {
          Navigator.pop(context);
        },
        gradient: const LinearGradient(
            colors: [Color(0xFF7A7FFF), Color(0xFF040862)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        child: Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
          child: const Text(
            "Adicionar dependente",
            style: TextStyle(
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Color(0xFFFFFFFF)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ChildrenDataBox(
              nameController: _nomeCriancaController,
              dateController: _dataNascimentoController,
              initialName: widget.children?.name,
              initialDate: widget.children?.birthdate != null
                  ? DateFormat('dd/MM/yyyy').format(widget.children!.birthdate)
                  : null,
            ),
            const SizedBox(height: 32),
            SelectedGoals(
              availableGoals: _conteudosDisponiveis,
              selectedGoals: _conteudosSelecionados,
            ),
            const SizedBox(height: 32),
            Center(
              child: LoginEnterButton(
                title: "Salvar",
                colors: const [Color(0xFF646AE3), Color(0xFF262B91)],
                onPressed: _saveDependent,
              ),
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    _nomeCriancaController.dispose();
    _dataNascimentoController.dispose();
    super.dispose();
  }
}
