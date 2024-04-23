import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChildrenDataBox extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController dateController;
  final String? initialName;
  final String? initialDate;

  ChildrenDataBox({
    Key? key,
    required this.nameController,
    required this.dateController,
    this.initialName,
    this.initialDate,
  }) : super(key: key) {
    if (initialName != null) nameController.text = initialName!;
    if (initialDate != null) dateController.text = initialDate!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Dados do dependente",
          style: TextStyle(
              fontFamily: "Fieldwork-Geo",
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Color(0xFF3C3C3C)),
        ),
        const Text("Adicione o nome e a data de nascimento do\nseu dependente",
            style: TextStyle(
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Color(0xFF5C5C5C))),
        SizedBox(height: 16),
        Row(
          children: [
            SizedBox(
              height: 56,
              width: (MediaQuery.of(context).size.width / 2) - 24,
              child: TextField(
                style: const TextStyle(
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w400,
                    color: Color(0xff5A5A5A),
                    fontSize: 14),
                controller: nameController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(
                      fontFamily: "Fieldwork-Geo",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9A9A9A),
                      fontSize: 14),
                  labelText: 'Nome da Criança',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: nameController.text.isEmpty
                          ? Colors.grey
                          : const Color(0xff7A7FFF),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              height: 56,
              width: (MediaQuery.of(context).size.width / 2) - 24,
              child: TextField(
                style: const TextStyle(
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w400,
                    color: Color(0xff5A5A5A),
                    fontSize: 14),
                controller: dateController,
                decoration: InputDecoration(
                  labelText: 'Data de Nascimento',
                  labelStyle: const TextStyle(
                      fontFamily: "Fieldwork-Geo",
                      fontWeight: FontWeight.w400,
                      color: Color(0xff9A9A9A),
                      fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: dateController.text.isEmpty
                          ? Colors.grey
                          : const Color(0xff7A7FFF),
                    ),
                  ),
                ),
                onTap: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    dateController.text =
                        DateFormat('dd/MM/yyyy').format(selectedDate);
                  }
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
