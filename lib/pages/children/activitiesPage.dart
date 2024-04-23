import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/activities/activitiesList.dart';
import 'package:provider/provider.dart';

class ChildrenActivitiesPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ChildrenActivitiesPage({required this.pagePosition});

  @override
  Widget build(BuildContext context) {
    VolatileChildren child = Provider.of<VolatileChildren>(context);

    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 1,
        pagePosition: pagePosition.value,
        heigth: 210,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
          child:RichText(
          text: const TextSpan(children: [
            TextSpan(
                text: 'Atividades\n',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w600)),
            TextSpan(
                text:
                    '\nAprenda com o Connie sobre educação financeira,\nde forma lúdica e rápida.Vamos lá?!',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w300))
          ]),
        ),)
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                const Text(
                  'Suas atividades',
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontFamily: "Fieldwork-Geo",
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
                const Text(
                  'Realize suas atividades a qualquer momento',
                  style: TextStyle(
                      color: Color(0xFF5C5C5C),
                      fontFamily: "Fieldwork-Geo",
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 8),
                ActivitiesList(child: child),
                const SizedBox(height: 120,)
              ]))),
    
    );
  }
}
