import 'package:learn/classes/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn/utils/levelBarUtils.dart';
import 'package:flutter/material.dart';

final DateTime now = DateTime.now();
final today = DateTime(now.year, now.month, now.day);

class AcheivmentsDate {
  DateTime date;
  int id;
  AcheivmentsDate({required this.date, required this.id});
}

class Children extends Person {
  String childrenCode;
  DateTime birthdate;
  int pontuation;
  final List<String> goals;
  final List<List<int>> activities;
  final List<AcheivmentsDate> acheivments;
  int lastActivitie;
  final Map<DateTime, int> xpPerDay;

  Children({
    required this.childrenCode,
    required this.birthdate,
    this.pontuation = 0,
    this.activities = const [],
    this.goals = const [],
    this.acheivments = const [],
    this.lastActivitie = 0,
    this.xpPerDay = const {},
    required String name,
    required String photoPath,
    DateTime? lastAccsess,
  }) : super(name: name, photoPath: photoPath, lastAccsess: lastAccsess);

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

  Map<String, dynamic> getValues() {
    int selected = 0;
    levelsPontuations.keys.forEach((value) {
      if (value <= pontuation && value >= selected) {
        selected = value;
      }
    });
    return levelsPontuations[selected] ?? {'level' : 'Bronze', 'class' : 'I', 'nextLevelValue' : 200, 'levelValue': 0};
  }

  String getLevel(){
    return getValues()['level'] as String;
  }

  String getClass(){
    return getValues()['class'] as String;
  }

  
  Stack getShield() {
    return Stack(alignment: Alignment.center, children: [
      Center(
        child: Image.asset(
          'assets/images/appIcons/badge-${getLevel().toLowerCase()}-${"blue"}.png',
          width: 72,
        ),
      ),
      Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            getClass(),
            style: const TextStyle(
                color: Color(0xFF040862),
                fontSize: 32,
                fontFamily: 'Fieldwork-Geo',
                fontWeight: FontWeight.w800),
          ))
    ]);
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
    if (!added) {
      children.activities.add([]);
    }
    children.acheivments.add(AcheivmentsDate(date: today, id: 4));
    children.pontuation += 100;
    children.update();
    notifyListeners();
  }
}