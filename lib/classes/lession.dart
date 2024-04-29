import 'package:flutter/material.dart';
import 'package:learn/classes.dart';
import 'package:learn/docs/activities/lession01Main.dart';
import 'package:learn/utils.dart';

final defaultLessonMain = Lession01Main();

@immutable
class Lesson {
  final int id;
  final String title;
  final String description;
  final String pageRouter;

  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    this.pageRouter = "/lession01",
  });

  factory Lesson.fromId(int number){
    return lessionsList[number] ?? constLession;
  }

  void launchLession(BuildContext context, VolatileChildren children){
  Navigator.pushReplacementNamed(
    context, pageRouter,
    arguments: children
  );
}
}

@immutable
class Activitie {
  final int id;
  final String title;
  final String description;
  final List<Color> backgroundColors;
  final List<int> lessions;
  final String? iconPath;

  const Activitie({
    required this.id,
    required this.title,
    required this.description,
    this.lessions = const [],
    this.backgroundColors = const [Color(0XFF1290A2), Color(0xFF82DA59)],
    this.iconPath,
  });

  Lesson? getLesson(int index){
    return lessionsList[index];
  }
}