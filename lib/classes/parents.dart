import 'package:learn/classes/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn/classes/children.dart';

class Parents extends Person {
  final List<Children> dependents;

  Parents({
    required String name,
    required String photoPath,
    this.dependents = const [],
  }) : super(name: name, photoPath: photoPath);

  Map<String, dynamic> getJson() {
    return {
      'name': name,
      'photoPath': photoPath,
      'dependents': dependents.map((e) => e.childrenCode).toList(),
    };
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
    parents.dependents.add(children);
    notifyListeners();
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
    return Parents(name: name, photoPath: photoPath, dependents: childrenList);
  }
  throw Exception();
}