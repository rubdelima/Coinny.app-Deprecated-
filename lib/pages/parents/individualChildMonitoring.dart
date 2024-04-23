import 'package:flutter/material.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/conquists/achivievementWidget.dart';
import 'package:learn/widgets/global/globalProgressWidget.dart';
import 'package:learn/utils/activitiesList.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/activities/lessionCard.dart';

class ChildMonitoringSpecific extends StatelessWidget {
  final Children children;

  const ChildMonitoringSpecific({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBarSuper(
        superHeigth: 300,
        globalHeigth: 280,
        superWidget: Column(
          children: [
            GlobalProgress(
              pontuation: 100,
              isMascot: false,
            ),
          ],
        ),
        pageIndex: 1,
        backButtonFunction: () {
          Navigator.pop(context);
        },
        child: Container(
            padding: const EdgeInsets.fromLTRB(14, 40, 14, 0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${children.name}\n',
                    style: const TextStyle(
                        fontSize: 18,
                        fontFamily: "Fieldwork-Geo",
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF)),
                  ),
                ),
              ],
            )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            AchievementsWidget(
              childAcheivments: children.acheivments,
              withText: false,
           ),
           const SizedBox(height: 16),
            RichText(
              text: const TextSpan(
                children: [
                  
                  TextSpan(
                    text: 'Conceitos aprendidos\n',
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontFamily: "Fieldwork-Geo",
                        fontSize: 14,
                        fontWeight: FontWeight.w800),
                  ),
                  WidgetSpan(child: SizedBox(height: 18)),
                  TextSpan(
                      text: 'Essas foram as atividades que a criança já concluiu e os conceitos aprendidos!',
                      style: TextStyle(
                          color: Color(0xFF5C5C5C),
                          fontFamily: "Fieldwork-Geo",
                          fontSize: 12,
                          fontWeight: FontWeight.w300))
                ],
              ),
            ),
            const SizedBox(height: 16),
            Column(
            children: activitiesList[children.lastActivitie]
                .lessionsList
                .where((e) =>
                    children.activities[children.lastActivitie].length >
                    e.id) 
                .map((e) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: LessionCardStatic(
                    lession: e, isFinished: true, isLocked: false, callback: (){},),
              );
            }).toList(),
          ),

          const SizedBox(height: 16),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Próximos passos\n',
                  style: TextStyle(
                      color: Color(0xFF222222),
                      fontFamily: "Fieldwork-Geo",
                      fontSize: 14,
                      fontWeight: FontWeight.w800),
                ),
                WidgetSpan(child: SizedBox(height: 18)),
                TextSpan(
                    text:
                        'Essas são as próximas atividades a serem cobertas pela crança!',
                    style: TextStyle(
                        color: Color(0xFF5C5C5C),
                        fontFamily: "Fieldwork-Geo",
                        fontSize: 12,
                        fontWeight: FontWeight.w300))
              ],
            ),
          ),
          Column(
            children: activitiesList[children.lastActivitie]
                .lessionsList
                .where((e) =>
                    children.activities[children.lastActivitie].length <
                    e.id) 
                .map((e) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: LessionCardStatic(
                    lession: e, isFinished: false, isLocked: true, callback: (){},),
              );
            }).toList(),
          ),


       ]),
      ),
    );
  }
}