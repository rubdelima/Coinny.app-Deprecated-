import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';

class ChildSelect extends StatelessWidget {
  final Children? child;
  final VoidCallback? onTap;
  final bool isSelected;

  ChildSelect({
    this.child,
    this.onTap,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color textColor = isSelected ? Colors.white : const Color(0xFF3034A1);
    final Color boxColor = isSelected ? const Color(0xFF3034A1) : Colors.transparent;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
        alignment: Alignment.center,
        height: 48,
        width: 168,
        decoration: BoxDecoration(
          color: boxColor,
          border: Border.all(color: const Color(0xFF3034A1), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child == null
            ? Text("Todos", style: TextStyle(color: textColor, fontFamily: "Fieldwork-Geo", fontWeight: FontWeight.w700))
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(child?.photoPath ?? "" , height: 32), // Ajuste conforme a necessidade do tamanho da imagem.
                  const SizedBox(width: 10),
                  Text(child?.name ?? "" , style: TextStyle(color: textColor, fontFamily: "Fieldwork-Geo", fontWeight: FontWeight.w700)),
                ],
              ),
      ),
    );
  }
}