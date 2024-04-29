import 'package:flutter/material.dart';
import 'package:learn/widgets.dart';
import 'package:learn/classes.dart';

class ChildMonitoringSpecific extends StatelessWidget {
  final Children children;

  const ChildMonitoringSpecific({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
        superWidget:GlobalProgress(
              pontuation: children.pontuation,
              isMascot: false,
            ),
        backButtonFunction: () {
          Navigator.pop(context);
        },
        pageTitle: children.name,
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AchievementsWidget(
            childAcheivments: children.acheivments,
            withText: false,
          ),
          const SizedBox(height: 16),
          MonitoringLesson(children: children),
          const SizedBox(height: 16),
          MonitoringLesson(children: children, isNextSteps: true,),
        ]),
      ),
    );
  }
}
