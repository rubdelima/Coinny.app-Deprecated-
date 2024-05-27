import 'package:flutter/material.dart';

class ChildrenAccessInput extends StatelessWidget {
  final List<TextEditingController> controllers;
  final List<FocusNode> focuses;

  const ChildrenAccessInput({
    required this.controllers,
    required this.focuses,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        4,
        (index) => Expanded(
          child: AspectRatio(
            aspectRatio: 4 / 5,
            child: Container(
              margin: const EdgeInsets.all(4.0),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child: Center(
                child: TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  cursorColor: Colors.black,
                  // Estilo da borda
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                    hintText: '0',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 24.0,
                    ),
                  ),
                  controller: controllers[index],
                  focusNode: focuses[index],
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
