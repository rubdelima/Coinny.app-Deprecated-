import 'package:flutter/material.dart';
import "package:learn/classes.dart";
import "package:learn/widgets.dart";

class MonitoringLesson extends StatelessWidget {
  final bool isNextSteps;
  final Children children;

  const MonitoringLesson(
      {required this.children, this.isNextSteps = false, super.key});

  RichText getWidgetText() {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
        text: isNextSteps ? 'Próximos passos\n' : "Conceitos aprendidos\n",
        style: const TextStyle(
            color: Color(0xFF222222),
            fontSize: 14,
            fontWeight: FontWeight.w800),
      ),
      const WidgetSpan(child: SizedBox(height: 18)),
      TextSpan(
          text: isNextSteps
              ? 'Essas são as próximas atividades a serem cobertas pela crança!'
              : 'Essas foram as atividades que a criança já concluiu e os conceitos aprendidos!',
          style: const TextStyle(
              color: Color(0xFF5C5C5C),
              fontSize: 12,
              fontWeight: FontWeight.w300))
    ], style: const TextStyle(fontFamily: "Fieldwork-Geo")));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getWidgetText(),
        const SizedBox(height: 16),
        LessionCardStatic(
          lession: Lesson.fromId(children.lastActivitie + (isNextSteps ? 1 : 0)),
          isFinished: true,
          isLocked: false,
          children: VolatileChildren(children: children),
        ),
      ],
    );
  }
}
