import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn/utils/levelBarUtils.dart';

final DateTime now = DateTime.now();
final today = DateTime(now.year, now.month, now.day);

class AcheivmentsDate {
  DateTime date;
  int id;
  AcheivmentsDate({required this.date, required this.id});
}

class Children {
  String childrenCode;
  String name;
  String photoPath;
  DateTime birthdate;
  int pontuation;
  DateTime? lastAccsess;
  final List<String> goals;
  final List<List<int>> activities;
  final List<AcheivmentsDate> acheivments;
  int lastActivitie;
  final Map<DateTime, int> xpPerDay;

  Children({
    required this.childrenCode,
    required this.name,
    required this.birthdate,
    this.photoPath = "assets/images/appImages/ianzinho.jpg",
    this.pontuation = 0,
    this.activities = const [],
    this.goals = const [],
    this.acheivments = const [],
    this.lastAccsess,
    this.lastActivitie = 0,
    this.xpPerDay = const {},
  });

  Map<String, dynamic> getJson() {
    return {
      'name': name,
      'birthdate': Timestamp.fromDate(birthdate),
      'photoPath': photoPath,
      'pontuation': pontuation,
      'activities': activities.map((e) => e.join(',')).toList(),
      'goals': goals,
      'acheivments': acheivments.map((e) {
        return {
          'date': Timestamp.fromDate(e.date),
          'id': e.id,
        };
      }).toList(),
      'lastAccsess': Timestamp.fromDate(lastAccsess ?? today),
      'lastActivitie': lastActivitie,
      'xpPerDay': xpPerDay.entries.map(
        (entry) {
          return {
            'date': Timestamp.fromDate(entry.key),
            'xp': entry.value,
          };
        },
      )
    };
  }

  Future<void> update() async {
    await FirebaseFirestore.instance
        .collection('children')
        .doc(childrenCode)
        .set(getJson())
        .catchError((error) => print('Erro ao adicionar documento: $error'));
  }
}

Future<Children> loadChildren(String childrenCode) async {
  DocumentSnapshot childData = await FirebaseFirestore.instance
      .collection('children')
      .doc(childrenCode)
      .get();

  if (childData.exists) {
    String name = childData.get("name");
    String photoPath = childData.get("photoPath");
    Timestamp birthdate = childData.get("birthdate");
    int pontuation = childData.get("pontuation");
    Timestamp lastAccsess = childData.get("lastAccsess");
    List<dynamic> getList = childData.get("goals");
    List<String> goals = getList.map((item) => item.toString()).toList();
    getList = childData.get("activities");
    List<String> activitiesStr =
        getList.map((item) => item.toString()).toList();
    List<List<int>> activities = [];
    for (var act in activitiesStr) {
      try {
        activities.add(act.split(',').map((e) => int.parse(e)).toList());
      } catch (e) {
        activities.add(const []);
      }
    }
    int lastActivitie = childData.get("lastActivitie");
    getList = childData.get("acheivments");

    List<Map<String, dynamic>> achv = getList.map((item) {
      if (item is Map) {
        return Map<String, dynamic>.from(item);
      } else {
        return <String, dynamic>{};
      }
    }).toList();

    List<AcheivmentsDate> acheivments = achv.map((e) {
      Timestamp tdate = e['date'];
      int id = e['id'];
      return AcheivmentsDate(
        date: tdate.toDate(),
        id: id,
      );
    }).toList();

    getList = childData.get("xpPerDay");
    List<Map<String, dynamic>> xpList =
        getList.map<Map<String, dynamic>>((item) {
      return Map<String, dynamic>.from(item);
    }).toList();
    Map<DateTime, int> xpPerDay = {};
    xpList.forEach((e) {
      xpPerDay[e['date'].toDate()] = e['xp'];
    });
    return Children(
        childrenCode: childrenCode,
        name: name,
        birthdate: birthdate.toDate(),
        photoPath: photoPath,
        pontuation: pontuation,
        activities: activities,
        goals: goals,
        acheivments: acheivments,
        lastAccsess: lastAccsess.toDate(),
        lastActivitie: lastActivitie,
        xpPerDay: xpPerDay);
  }
  throw Exception("Não existe essa criaça no banco de dados");
}

class VolatileChildren extends ValueNotifier<Children> {
  Children children;

  VolatileChildren({required this.children}) : super(children);

  void setChildren(Children children) {
    this.children = children;
    notifyListeners();
  }

  void addPontuation(int value) {
    children.pontuation += value;
    children.xpPerDay.update(today, (existingValue) => existingValue + value,
        ifAbsent: () => value);
    children.update();
    notifyListeners();
  }

  void addActivity() {
    bool added = false;
    for (int i = 0; i < children.activities.length; i++) {
      if (children.activities[i].length < 3) {
        children.activities[i].add(children.activities[i].length);
        added = true;
        break;
      }
    }
    if (!added) {children.activities.add([]);}
    children.acheivments.add(AcheivmentsDate(date: today, id: 4));
    children.pontuation += 100;
    children.update();
    notifyListeners();
  }
}

class Parents {
  String name;
  String photoPath;
  final List<Children> dependents;

  Parents({
    required this.name,
    this.photoPath = "assets/images/appImages/ianzinho.jpg",
    this.dependents = const [],
  });

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

int diffYears(DateTime birthDate) {
  DateTime now = DateTime.now();
  int years = now.year - birthDate.year;
  if (now.month < birthDate.month ||
      (now.month == birthDate.month && now.day < birthDate.day)) {
    years--;
  }
  return years;
}

int diffDays(DateTime date) {
  DateTime now = DateTime.now();
  return now.difference(date).inDays;
}

class Lession {
  final int id;
  final String title;
  final String description;
  Type? page;

  Lession({
    required this.id,
    required this.title,
    required this.description,
    this.page,
  });
}

class Activitie {
  final int id;
  final String title;
  final String description;
  final String pageTitle;
  final String pageDescription;
  final int level;
  final List<Color> backgroundColors;
  final List<Lession> lessionsList;
  final String? iconPath;

  Activitie({
    required this.id,
    required this.title,
    required this.description,
    this.pageTitle = "",
    this.pageDescription = "",
    this.lessionsList = const [],
    this.level = 1,
    this.backgroundColors = const [Color(0XFF1290A2), Color(0xFF82DA59)],
    this.iconPath,
  });
}

String getLevel(int pontuation){
  for (var val in levelsPontuations.entries){
    if (pontuation >= val.key && pontuation < val.value['nextLevelValue']){
      return "${val.value['level']} ${val.value['class']}";
    }
  }

  return "Diamante III";
}