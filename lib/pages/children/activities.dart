import 'package:flutter/material.dart';
import 'package:learn/classes.dart';
import 'package:learn/widgets/global/app_bar.dart';
import 'package:learn/widgets/activities/activitiesList.dart';
import 'package:provider/provider.dart';
import 'package:learn/components.dart';

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
          child: const CoinnyTitleSubTitlePage(
            title: "Conquistas",
            subTitle:
                "Aprenda com a Connie sobre educação financeira\ndeforma lúdica e rápida. Vamos lá?!",
          )),
      body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const CoinnyWidgetTitle(
                title: 'Suas atividades\n',
                description: 'Realize suas atividades a qualquer momento'),
            const SizedBox(height: 8),
            ActivitiesList(child: child),
            const SizedBox(
              height: 120,
            )
          ])),
    );
  }
}
