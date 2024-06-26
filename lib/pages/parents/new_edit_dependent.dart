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
  final TextEditingController _photoPath = TextEditingController();
  List<String> _selectedGoals = [];
  final Children tempChildren = Children(
    childrenCode: "XXXX",
    name: "",
    birthdate: DateTime.now(),
    photoPath: "",
    goals: [],
  );

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
          childrenCode:
              _birthdate.text.split("").map((e) => int.parse(e)).toList(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.children != null) {
      _name.text = widget.children!.name;
      _birthdate.text =
          DateFormat('dd/MM/yyyy').format(widget.children!.birthdate);
      _selectedGoals = widget.children!.goals;
      _photoPath.text = widget.children!.photoPath;
    }
  }

  void _updatePhoto() {
    setState(() {});
  }

  void _updateGoals(List<String> newGoals) {
    setState(() {
      _selectedGoals = newGoals;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 88),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 128,
                  width: MediaQuery.sizeOf(context).width - (128 + 32 + 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const NewBackButton(),
                      Text(
                        "Adicionar dependente",
                        style: CoinnyTextStyles.personalized(
                          color: CoinnyColors.textDarkPurple,
                          fontSize: 28,
                          fontWeigth: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                PhotoProfile(
                  photoPathController: _photoPath,
                  onPhotoChanged: _updatePhoto,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              "Dados básicos",
              style: CoinnyTextStyles.body_2_medium(
                  color: CoinnyColors.textDarkPurple),
            ),
            const SizedBox(height: 24),
            CoinnyTextField(textController: _name, labelName: "Nome"),
            const SizedBox(height: 16),
            CoinnyTextField(
              textController: _birthdate,
              labelName: "Data de Nascimento",
              isCalendar: true,
            ),
            const SizedBox(height: 48),
            Text(
              "Objetivos de aprendizado",
              style: CoinnyTextStyles.body_2_medium(
                  color: CoinnyColors.textDarkPurple),
            ),
            const SizedBox(height: 16),
            Text(
              "Selecione os tópicos de estudo mais importantes para o seu dependente.",
              style: CoinnyTextStyles.body_3_medium(
                  color: CoinnyColors.suportTextGrey),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                showRelationshipDialog(context, _selectedGoals, _updateGoals);
              },
              child: Container(
                height: 54,
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(46),
                  border: Border.all(
                    color: const Color(0xFFC7C7C7),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _selectedGoals.isEmpty
                          ? "Selecione"
                          : "${_selectedGoals.length} objetivos selecionados",
                      style: CoinnyTextStyles.body_2_medium(
                        color: _selectedGoals.isEmpty
                            ? CoinnyColors.darkGrey
                            : CoinnyColors.suportTextGrey,
                      ),
                    ),
                    Image.asset(
                      "assets/images/appIcons/right_arrow.png",
                      height: 12,
                      color: _selectedGoals.isEmpty
                          ? CoinnyColors.darkGrey
                          : CoinnyColors.suportTextGrey,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            Center(
              child: CoinnyGradientButton(
                color: (_name.text.isEmpty || _birthdate.text.isEmpty)
                    ? const Color(0xFF848484)
                    : const Color(0xff5D61D6),
                title: widget.children == null ? "ADICIONAR" : "SALVAR",
                onPressed: () {
                  (_name.text.isEmpty || _birthdate.text.isEmpty)
                      ? null
                      : saveLauncher();
                },
              ),
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
    _photoPath.dispose();
    super.dispose();
  }
}

void showRelationshipDialog(BuildContext context, List<String> selectedGoals,
    ValueChanged<List<String>> onGoalsChanged) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            height: MediaQuery.sizeOf(context).height * 0.8,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 54,
                ),
                SizedBox(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Biblioteca de ícones',
                      style: CoinnyTextStyles.h5_medium(
                          color: CoinnyColors.textDarkPurple, fontSize: 23),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Escolha um ícone que mais representa o seu dependente!',
                      style: CoinnyTextStyles.body_2_medium(
                          color: CoinnyColors.suportTextGrey),
                    ),
                  ],
                )),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      buildOption('Mesada', selectedGoals, setState),
                      buildOption('Criptomoedas', selectedGoals, setState),
                      buildOption('Economizar', selectedGoals, setState),
                      buildOption('Investimento', selectedGoals, setState),
                      buildOption('Poupança', selectedGoals, setState),
                      buildOption('Responsabilidade', selectedGoals, setState),
                      //buildOption('Outros', selectedGoals, setState),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Positioned(
                  child: CoinnyGradientButton(
                    onPressed: () {
                      onGoalsChanged(
                          List.from(selectedGoals)); // Notify parent widget
                      Navigator.pop(context); // Close the bottom sheet
                    },
                    title: "SALVAR",
                    color: selectedGoals.isEmpty
                        ? const Color(0xFF848484)
                        : const Color(0xff5D61D6),
                  ),
                )
              ],
            ),
          );
        },
      );
    },
  );
}

Widget buildOption(
    String title, List<String> selectedGoals, StateSetter setState) {
  return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedGoals.contains(title)) {
            selectedGoals.remove(title);
          } else {
            selectedGoals.add(title);
          }
        });
      },
      child:
          //Chip(
          //  label: Text(title),
          //  backgroundColor: selectedGoals.contains(title) ? Colors.blue : Colors.grey[200],
          //),
          Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: selectedGoals.contains(title)
                      ? CoinnyColors.mainPink
                      : CoinnyColors.textDarkPurple,
                  width: 1.0,
                ),
              ),
              child: Text(title,
                  style: CoinnyTextStyles.body_2_medium(
                      color: selectedGoals.contains(title)
                          ? CoinnyColors.mainPink
                          : CoinnyColors.textDarkPurple))));
}

class CoinnyTextField extends StatelessWidget {
  final TextEditingController textController;
  final String labelName;
  final bool isCalendar;
  const CoinnyTextField({
    Key? key,
    required this.textController,
    required this.labelName,
    this.isCalendar = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextField(
        style:
            CoinnyTextStyles.body_2_medium(color: CoinnyColors.suportTextGrey),
        controller: textController,
        decoration: InputDecoration(
            labelStyle:
                CoinnyTextStyles.body_2_medium(color: CoinnyColors.darkGrey),
            labelText: labelName,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(46)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(46),
              borderSide: BorderSide(
                color: textController.text.isEmpty
                    ? CoinnyColors.darkGrey
                    : const Color(0xff7A7FFF),
              ),
            ),
            suffixIcon: isCalendar ? const Icon(Icons.calendar_month) : null),
        onTap: isCalendar
            ? () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (selectedDate != null) {
                  textController.text =
                      DateFormat('dd/MM/yyyy').format(selectedDate);
                }
              }
            : null,
      ),
    );
  }
}
