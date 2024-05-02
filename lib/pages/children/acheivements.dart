import 'package:flutter/material.dart';
import 'package:learn/utils.dart';
import 'package:learn/widgets.dart';
import 'package:learn/components.dart';

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

    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 0,
        child: const CoinnyTitleSubTitlePage(
          title: "Conquistas",
          subTitle:
              "Aprenda com a Connie sobre educação financeira\ndeforma lúdica e rápida. Vamos lá!?",
        ),
        backButtonFunction: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const CoinnyText('Alcançadas',
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 14),
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
                    width: screenWidth / 2 - 20,
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 32,
          ),
          const CoinnyText('Próximos',
              color: Color(0xFF000000),
              fontWeight: FontWeight.w700,
              fontSize: 14),
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
                    isLocked: true,
                  ),
                )
                .toList(),
          ),
        ]),
      ),
    );
  }
}
