import 'package:flutter/material.dart';
import 'package:learn/pages/parents/sugestionPage.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/profile/user-profile.dart';
import 'package:learn/widgets/global/globalProgressWidget.dart';
import 'package:learn/utils/modelsClass.dart';
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
      appBar: LearnAppBarSuper(
        superHeigth: 320,
        superWidget: GlobalProgress(pontuation: 100, isMascot: false,),
        pageIndex: 1,
        pagePosition: pagePosition.value,
        child: Container(
          padding: const  EdgeInsets.fromLTRB(14, 56, 14, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserPhotoAndName(
                userName: parent.value.name,
                userPhotoPath: parent.value.photoPath,
                firstLine: "Seja bem-vindo,\n",
                fontWeight1: FontWeight.w400,
                secondLine: parent.value.name,
                fontWeight2: FontWeight.bold,
              ),
            ]
          )
        ),
      ),
      body:Container (
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: SingleChildScrollView(
        child: Column(
          children: [
            ShowSugestion(
              onPressed: (){
                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActivitiesSugestionPage(children: parent.value.dependents[0])));
              },
              width: MediaQuery.sizeOf(context).width-32, 
              childName: parent.value.dependents[0].name, 
              activitieName: "Orçamento de um passeio no Shopping"
            ),
            const SizedBox(height: 32,),
            MonitoringWidget(parent: parent.value),
            const SizedBox(height: 80,)
          ],
        ),
      ),
    ));
  }
}