import 'package:flutter/material.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/conquists/achivievementIcons.dart';
import 'package:learn/utils/acheiviementsList.dart';

class AchiviementsPage extends StatelessWidget {
  final List<AcheivmentsDate> childAcheivments;

  AchiviementsPage({required this.childAcheivments});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    Set<int> childAchievementsIds = childAcheivments.map((a) => a.id).toSet();
    
    List<AcheivmentsDate> missingAchievements = [];

    for (var achievement in achievementsList) {
      if (!childAchievementsIds.contains(achievement.id)) {
        missingAchievements
            .add(AcheivmentsDate(date: DateTime.now(), id: achievement.id));
      }
    }
    print(missingAchievements.length);

    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 0,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 80, 16, 0),
          child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Conquistas',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Fieldwork-Geo",
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                    'Aprenda com a Connie sobre educação financeira\nde forma lúdica e rápida. Vamos lá?!',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Fieldwork-Geo",
                        fontWeight: FontWeight.w300,
                        fontSize: 12),
                    textAlign: TextAlign.start),
              ]),
        ),
        backButtonFunction: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Alcançadas',
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.w700,
                fontSize: 14),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: childAcheivments
                .map(
                  (e) => AchievementIcon(
                      achievmentId: e.id,
                      conclusionDate: e.date,
                      heigth: screenWidth / 2 - 20,
                      width: screenWidth / 2 - 20,),
                )
                .toList(),
          ),
          const SizedBox(
            height: 32,
          ),
          const Text(
            'Bloqueadas',
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Fieldwork-Geo",
                fontWeight: FontWeight.w700,
                fontSize: 14),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 16,
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: missingAchievements
                .map(
                  (e) => AchievementIcon(
                      achievmentId: e.id,
                      conclusionDate: e.date,
                      heigth: screenWidth / 2 - 20,
                      width: screenWidth / 2 - 20,
                      isLocked: true,),
                )
                .toList(),
          ),
        ]),
      ),
    );
  }
}
