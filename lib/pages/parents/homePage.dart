import 'package:flutter/material.dart';
import 'package:learn/pages/parents/sugestionPage.dart';
import 'package:learn/widgets/global/app_bar.dart';
import 'package:learn/components/user_profile.dart';
import 'package:learn/widgets/global/progress.dart';
import 'package:learn/classes.dart';
import 'package:learn/widgets/notifications/showSugestion.dart';
import 'package:learn/widgets/monitoring/monitoramento.dart';
import 'package:provider/provider.dart';

class ParentsHPage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ParentsHPage({
    required this.pagePosition,
  });

  @override
  Widget build(BuildContext context) {
    VolatileParents parent = Provider.of<VolatileParents>(context);

    return Scaffold(
        appBar: LearnAppBar(
          superWidget: GlobalProgress(
            pontuation: 100,
            isMascot: false,
          ),
          pageIndex: 1,
          pagePosition: pagePosition.value,
          child: Container(
            padding: const EdgeInsets.fromLTRB(14, 56, 14, 0),
            child: UserPhotoAndName(
              person: parent.value,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ShowSugestion(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivitiesSugestionPage(
                                  children: parent.value.dependents[0])));
                    },
                    width: MediaQuery.sizeOf(context).width - 32,
                    childName: parent.value.dependents[0].name,
                    activitieName: "Orçamento de um passeio no Shopping"),
                const SizedBox(
                  height: 32,
                ),
                MonitoringWidget(parent: parent.value),
                const SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ));
  }
}
