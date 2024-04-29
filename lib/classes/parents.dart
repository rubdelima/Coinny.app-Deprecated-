import 'package:learn/classes/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn/classes/children.dart';

class Parents extends Person {
  final String email;
  final Map<String, Children> dependents;

  Parents({
    required String name,
    required String photoPath,
    required this.email,
    this.dependents = const {},
  }) : super(name: name, photoPath: photoPath);

  Map<String, dynamic> getJson() {
    return {
      'name': name,
      'photoPath': photoPath,
      'dependents': dependents.keys,
    };
  }

  int getPontuation(){
    return dependents.isEmpty
    ? 0
    : (dependents.values.fold(0, (sum, dependent) => sum + dependent.pontuation) / dependents.length).round();
  }
}

class VolatileParents extends ValueNotifier<Parents> {
  Parents parents;
  VolatileParents({required this.parents}) : super(parents);

  void setParents(Parents parents) {
    this.parents = parents;
    notifyListeners();
  }

  void addDependent(Children children) {
    parents.dependents[children.childrenCode] = children;
    notifyListeners();
  }

  void saveDependent({
    required String name,
    required DateTime birthdate,
    required String childrenCode,
    required List<String> goals,
    String photoPath = "assets/images/mascote/mascot-happy.png",
  }) async {
    Children child = parents.dependents[childrenCode] ?? Children.newChildren(childrenCode);
    
    child.saveEdit(name: name, birthdate: birthdate, childrenCode: childrenCode, goals: goals);

    await FirebaseFirestore.instance
        .collection('children')
        .doc(childrenCode)
        .set(child.getJson())
        .catchError((error) => print('Erro ao adicionar documento: $error'));

    addDependent(child);

    await FirebaseFirestore.instance
        .collection('parent')
        .doc(parents.email)
        .set(parents.getJson())
        .catchError((error) => print('Erro ao adicionar documento: $error'));
  }
}

Future<Parents> loadParent(String email) async {
  DocumentSnapshot parentData =
      await FirebaseFirestore.instance.collection('parent').doc(email).get();

  if (parentData.exists) {
    String name = parentData.get("name");
    String photoPath = parentData.get("photoPath");
    List<dynamic> getList = parentData.get("dependents");
    List<String> dependents = getList.map((item) => item.toString()).toList();
    List<Future<Children>> futureChildrenList =
        dependents.map((e) => loadChildren(e)).toList();

    List<Children> childrenList = await Future.wait(futureChildrenList);
    Map<String, Children> childrenMap = {};
    childrenList.forEach((e) {
      childrenMap[e.childrenCode] = e;
    });
    return Parents(email : email, name: name, photoPath: photoPath, dependents: childrenMap);
  }
  throw Exception();
}
