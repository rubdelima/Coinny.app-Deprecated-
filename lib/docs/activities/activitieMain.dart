import 'package:flutter/material.dart';
import 'package:learn/utils/activitiesList.dart';
import 'package:learn/widgets/activities/activitieCardStatic.dart';
import 'package:learn/widgets/global/app_bar.dart';
import 'package:learn/widgets/activities/activitieContentColumn.dart';
import 'package:learn/classes.dart';

class ActivitieMain extends StatelessWidget {
  final ActivitieCardStatic content;
  final VolatileChildren child;

  ActivitieMain({required this.content, required this.child});

  @override
  Widget build(BuildContext context) {
    final int activitieId = content.activitie.id;
    return Scaffold(
        appBar: LearnAppBar(
          superWidget: ActivitieCardStatic(
            activitie: content.activitie,
            isLocked: content.isLocked,
            withProgress: true,
            progress:
                getProgress(activitieId, child.value.activities[activitieId]),
          ),
          child: Container(
              padding: EdgeInsets.fromLTRB(
                  (MediaQuery.sizeOf(context).width / 2) - 48, 40, 16, 0),
              child: const Text(
                "Atividades",
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: "Fieldwork-Geo",
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.center,
              )),
          backButtonFunction: () {
            Navigator.pop(context);
          },
        ),
        body: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: SingleChildScrollView(
                child: ActivitieContentColumn(
              title: "Conteúdo das atividades",
              description: "Selecione a atividade",
              lessions: content.activitie.lessions
                  .map((e) => Lesson.fromId(e))
                  .toList(),
              activitieId: content.activitie.id,
              children:  child,
            ))));
  }
}
