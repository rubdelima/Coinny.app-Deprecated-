import 'package:flutter/material.dart';
import 'package:learn/widgets.dart';
import 'package:learn/components.dart';
import 'package:learn/classes.dart';

import 'package:provider/provider.dart';

class ParentsHome extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ParentsHome({
    required this.pagePosition,
  });

  @override
  Widget build(BuildContext context) {
    VolatileParents parent = Provider.of<VolatileParents>(context);

    return Scaffold(
      appBar: LearnAppBar(
        superWidget: GlobalProgress(
          pontuation: parent.value.getPontuation(),
          isMascot: false,
        ),
        pageIndex: 1,
        pagePosition: pagePosition.value,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: UserPhotoAndName(
            person: parent.value,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            ShowSugestion(
                children: parent.value.dependents.values.first,
                width: MediaQuery.sizeOf(context).width - 32,
                activitieName: "Orçamento de um passeio no Shopping"),
            const SizedBox(height: 32),
            MonitoringWidget(parent: parent.value),
            const SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
}
