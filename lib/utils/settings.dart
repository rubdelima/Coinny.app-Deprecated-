import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn/classes.dart';
import 'package:intl/intl.dart';

const List<String> globalGoals = [
  "Conteúdos básicos",
  "Finanças",
  "Investimentos",
  "Juros",
  "Poupança"
];

Future<String> getNewChildrenCode() async {
  final rng = Random();
  DocumentSnapshot childData;
  String childrenCodeString = "";
  do {
    List<int> childrenCode = List<int>.generate(4, (_) => rng.nextInt(10));
    childrenCodeString = childrenCode.map((e) => e.toString()).toList().join();
    childData = await FirebaseFirestore.instance
        .collection('children')
        .doc(childrenCodeString)
        .get();
  } while (childData.exists);
  return childrenCodeString;
}

Future<void> saveDependent(
    {required BuildContext context,
    required String name,
    required String birthdate,
    required VolatileParents parent,
    List<String> goals = const [],
    Children? children}) async {
  try {
    if (name.isEmpty) {
      throw ("O nome da criança não pode ser vazio");
    }
    if (birthdate.isEmpty) {
      throw ("A data de aniversário da crinça não pode ser vazia");
    }
  } on Exception catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
    return;
  }

  String childrenCodeString =
      children?.childrenCode ?? await getNewChildrenCode();

  parent.saveDependent(
      name: name,
      birthdate: DateFormat('dd/MM/yyyy').parse(birthdate),
      goals: goals,
      childrenCode: childrenCodeString);
}
