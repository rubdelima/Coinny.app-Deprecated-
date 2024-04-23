import 'package:flutter/material.dart';
import 'package:learn/widgets/activities/activitieCardAnimated.dart';
import 'package:learn/widgets/activities/activitieCardStatic.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/profile/StreakWidget.dart';
import 'package:learn/widgets/conquists/achivievementWidget.dart';
import 'package:learn/widgets/profile/user-profile.dart';
import 'package:learn/widgets/global/globalProgressWidget.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/utils/activitiesList.dart';
import 'package:provider/provider.dart';


class ChildrenHomePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  const ChildrenHomePage(
      {required this.pagePosition, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    VolatileChildren child = Provider.of<VolatileChildren>(context);
    return Scaffold(
      appBar: LearnAppBarSuper(
        superHeigth: 320,
        superWidget: GlobalProgress(
          pontuation: child.value.pontuation,
          isMascot: false,
        ),
        pageIndex: 1,
        pagePosition: pagePosition.value,
        child: Container(
            padding: const EdgeInsets.fromLTRB(14, 54, 14, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserPhotoAndName(
                    userName: child.value.name,
                    userPhotoPath: child.value.photoPath,
                    firstLine: "Seja bem-vindo,\n",
                    fontWeight1: FontWeight.w400,
                    secondLine: child.value.name,
                    fontWeight2: FontWeight.w500,
                  ),
                  StreakWidget(
                      streakDays:
                          diffDays(child.value.lastAccsess ?? DateTime.now())),
                ])),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Atividades em andamento\n',
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontFamily: "Fieldwork-Geo",
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  WidgetSpan(child: SizedBox(height: 16)),
                  TextSpan(
                      text: 'Continue de onde parou!',
                      style: TextStyle(
                          color: Color(0xFF5C5C5C),
                          fontFamily: "Fieldwork-Geo",
                          fontSize: 12,
                          fontWeight: FontWeight.w300))
                ],
              ),
            ),
            const SizedBox(height: 16),
            ActivitieCard(
              activitie: ActivitieCardStatic(
                activitie: activitiesList[child.value.lastActivitie],
                isLocked: false,
                withProgress: true,
                progress: getProgress(
                    child.value.lastActivitie, child.value.activities[child.value.lastActivitie]),
              ),
              child: child,
            ),
            const SizedBox(height: 16),
            AchievementsWidget(
              childAcheivments: child.value.acheivments,
            ),
            const SizedBox(height: 80,)
          ],
        ),
      ),
    );
  }
}
