import 'package:flutter/material.dart';
import 'package:learn/widgets/conquists/achivievementIcons.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/pages/children/acheivementsPage.dart';

class AchievementsWidget extends StatelessWidget {
  final List<AcheivmentsDate> childAcheivments;
  final bool withText;

  AchievementsWidget({required this.childAcheivments, this.withText = true});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(withText) const Text("Conquistas alcançadas",
            style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 14,
                fontFamily: 'Fieldwork-Geo',
                fontWeight: FontWeight.w600)),
        if(withText) const Text("Reconheça os seus filhos pelas suas vitórias!",
            style: TextStyle(
                color: Color(0xFF5C5C5C),
                fontSize: 12,
                fontFamily: 'Fieldwork-Geo',
                fontWeight: FontWeight.w300)),
        if(withText) const SizedBox(
          height: 12,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AchievementIcon(
                  achievmentId: childAcheivments[0].id,
                  conclusionDate: childAcheivments[0].date,
                  heigth: (screenWidth / 2 - 24)*1.1,
                  width: screenWidth / 2 - 24),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AchievementIcon(
                    achievmentId: childAcheivments[1].id,
                    conclusionDate: childAcheivments[1].date,
                    heigth: (((screenWidth / 2 - 24)*1.1)*2/3)-8,
                    width: screenWidth / 2 - 24,
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    child: Container(
                        width: screenWidth / 2 - 24,
                        height: (((screenWidth / 2 - 24)*1.1)*1/3)-2,
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF2F2F2F), Color(0xFF959595)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.circular(12.5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 8),
                              child: const Text("Ver todas as\nconquistas",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Fieldwork-Geo',
                                    fontWeight: FontWeight.w800)),
                            ),

                            Image.asset('assets/images/appIcons/icon-show-conquist.png'),
                                
                          ],
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AchiviementsPage(
                                  childAcheivments: childAcheivments)));
                    },
                  )
                ],
              )
            ],
          ),
      ],
    ));
  }
}