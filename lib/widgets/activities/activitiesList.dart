import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/activities/activitieCardStatic.dart';
import 'package:learn/widgets/activities/activitieCardAnimated.dart';
import 'package:learn/utils/activitiesList.dart';

class ActivitiesList extends StatelessWidget {
  final VolatileChildren child;

  const ActivitiesList({
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> atividades = [];
    for (var i = 0; i < activitiesList.length; i++) {
      atividades.add(Container(
        padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
        child: ActivitieCard(
          activitie: ActivitieCardStatic(
            activitie:activitiesList[i],
            isLocked: i +1 > child.value.activities.length,
            progress: child.value.activities.length > i ? getProgress(i, child.value.activities[i]) : 0,
            ),
            child: child,
        ),
      ));
    }

    return Column(
      children: atividades,
    );
  }
}