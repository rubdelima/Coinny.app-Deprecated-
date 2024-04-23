import 'package:flutter/material.dart';

class BoxedNumber extends StatelessWidget {
  final int number;
  BoxedNumber(this.number);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white, //
        borderRadius: BorderRadius.circular(8), 
        border: Border.all(color: Color(0xFF5B61D7), width: 1), 
        boxShadow: [
          BoxShadow(
            color: Color(0xff5B61D7).withOpacity(0.3), 
            spreadRadius: 1,
            blurRadius: 3, 
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        number.toString(),
        style: const TextStyle(
          fontSize: 24, 
          color: Color(0xFF3C3C3C),
          fontWeight: FontWeight.w700,
          fontFamily: "Fieldwork-Geo"
        ),
      ),
    );
  }
}