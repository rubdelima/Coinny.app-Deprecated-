import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:learn/utils.dart';
import 'package:learn/widgets.dart';
import 'package:learn/components.dart';

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
  final TextEditingController _name = TextEditingController();
  final TextEditingController _birthdate = TextEditingController();
  List<String> _selectedGoals = [];

  void saveLauncher() {
    saveDependent(
        context: context,
        name: _name.text,
        birthdate: _birthdate.text,
        parent: widget.parent);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VerificationCodePage(
                  childrenName: _name.text,
                  childrenCode: _birthdate.text
                      .split("")
                      .map((e) => int.parse(e))
                      .toList(),
                )));
  }

  @override
  void initState() {
    super.initState();
    if (widget.children != null) {
      _name.text = widget.children!.name;
      _birthdate.text =
          DateFormat('dd/MM/yyyy').format(widget.children!.birthdate);
      _selectedGoals = widget.children!.goals;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        pageTitle: "Adicionar dependente",
        backButtonFunction: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ChildrenDataBox(
              nameController: _name,
              dateController: _birthdate,
              initialName: widget.children?.name,
              initialDate: widget.children?.birthdate != null
                  ? DateFormat('dd/MM/yyyy').format(widget.children!.birthdate)
                  : null,
            ),
            const SizedBox(height: 32),
            SelectedGoals(
              availableGoals: globalGoals,
              selectedGoals: _selectedGoals,
            ),
            const SizedBox(height: 32),
            Center(
              child: CoinnyGradientButton(
                  title: "Salvar",
                  onPressed: saveLauncher),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _name.dispose();
    _birthdate.dispose();
    super.dispose();
  }
}
