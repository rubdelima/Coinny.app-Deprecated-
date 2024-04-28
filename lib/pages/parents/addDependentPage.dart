import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:learn/classes.dart';
import 'package:learn/widgets/global/app_bar.dart';
import '../../widgets/settings/selectedGoals.dart';
import '../../widgets/settings/childrenDataBox.dart';
import 'package:learn/widgets/login/loginEnterButton.dart';
import 'package:learn/pages/parents/verificationCodePage.dart';

class AddDependentPage extends StatefulWidget {
  final VolatileParents parent;
  final Children? children;

  AddDependentPage({
    required this.parent,
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

  Future<String> getNewChildrenCode() async {
    final rng = Random();
    DocumentSnapshot childData;
    String childrenCodeString = "";
    do {
      List<int> childrenCode = List<int>.generate(4, (_) => rng.nextInt(10));
      childrenCodeString =
          childrenCode.map((e) => e.toString()).toList().join();
      childData = await FirebaseFirestore.instance
          .collection('children')
          .doc(childrenCodeString)
          .get();
      print(childrenCode);
    } while (childData.exists);
    return childrenCodeString;
  }

  Future<void> _saveDependent() async {
    try {
      if (_nomeCriancaController.text.isEmpty) {
        throw ("O nome da criança não pode ser vazio");
      }
      if (_dataNascimentoController.text.isEmpty) {
        throw ("A data de aniversário da crinça não pode ser vazia");
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return;
    }

    String childrenCodeString = await getNewChildrenCode();

    widget.parent.saveDependent(
        name: _nomeCriancaController.text,
        birthdate:
            DateFormat('dd/MM/yyyy').parse(_dataNascimentoController.text),
        goals: _conteudosSelecionados,
        childrenCode: childrenCodeString);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerificationCodePage(
                  childrenName: _nomeCriancaController.text,
                  childrenCode: childrenCodeString.split("").map((e) => int.parse(e)).toList(),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
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
