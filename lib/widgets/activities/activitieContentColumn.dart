import "package:flutter/material.dart";
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/activities/lessionCard.dart';

const isStatic = false;

class ActivitieContentColumn extends StatelessWidget {
  final String title;
  final String description;
  final List<Lession> lessions;
  final VoidCallback callback;
  int finishedLessions;

  ActivitieContentColumn(
      {required this.title,
      required this.description,
      required this.lessions,
      required this.callback,
      this.finishedLessions = 0});

  @override
  Widget build(BuildContext context) {
    final List<Widget> atividades = [];

    for (var i = 0; i < lessions.length; i++) {
      atividades.add(Container(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: LessionCardStatic(
          lession: lessions[i],
          isLocked: !(i <= finishedLessions),
          isFinished: i < finishedLessions,
          callback: callback,
        ),
      ));
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                title,
                style: const TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 14,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w600),
              ),
              Text(
                description,
                style: const TextStyle(
                    color: Color(0XFF5C5C5C),
                    fontSize: 12,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w400),
              ),
            ]),
            const SizedBox(height: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: atividades,
          )
        ],
      ),
    );
  }
}