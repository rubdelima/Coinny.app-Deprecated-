import 'package:flutter/material.dart';
import "package:learn/classes.dart";
import "package:learn/widgets.dart";
import "package:learn/components.dart";

class MonitoringLesson extends StatelessWidget {
  final bool isNextSteps;
  final Children children;

  const MonitoringLesson(
      {required this.children, this.isNextSteps = false, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoinnyWidgetTitle(
          title: isNextSteps ? 'Próximos passos\n' : "Conceitos aprendidos\n",
          description: isNextSteps
              ? 'Essas são as próximas atividades a serem cobertas pela crança!'
              : 'Essas foram as atividades que a criança já concluiu e os conceitos aprendidos!',
        ),
        const SizedBox(height: 16),
        LessionCardStatic(
          lession:
              Lesson.fromId(children.lastActivitie + (isNextSteps ? 1 : 0)),
          isFinished: true,
          isLocked: false,
          children: VolatileChildren(children: children),
        ),
      ],
    );
  }
}
