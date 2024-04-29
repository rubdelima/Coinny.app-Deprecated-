import 'package:flutter/material.dart';
import 'package:learn/components/user_profile.dart';
import 'package:learn/widgets.dart';
import 'package:learn/classes.dart';
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
      appBar: LearnAppBar(
        superWidget: GlobalProgress(
          pontuation: child.value.pontuation,
          isMascot: false,
        ),
        pageIndex: 1,
        pagePosition: pagePosition.value,
        child: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: UserPhotoAndName(person: child.value)
                ),
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
            const SizedBox(height: 80,),
          ],
        ),
      ),
    );
  }
}
