import 'package:flutter/material.dart';
import 'package:learn/components.dart';
import 'package:learn/utils.dart';
import 'package:learn/widgets.dart';
import 'package:provider/provider.dart';
import 'package:learn/pages/activities_v1/activitie_launcher.dart';

final List<ActivitieBlock> blocks = [
  ActivitieBlock(imagePath: "assets/images/activities/planejar.png", state: 3),
  ActivitieBlock(imagePath: "assets/images/activities/metas.png", state: 3),
  ActivitieBlock(imagePath: "assets/images/activities/nece.png", state: 3),
  ActivitieBlock(imagePath: "assets/images/activities/poup.png", state: 3),
  ActivitieBlock(imagePath: "assets/images/activities/como.png", state: 3),
  ActivitieBlock(imagePath: "assets/images/activities/visao.png", state: 3),
];

class Activities_V1 extends StatelessWidget {
  const Activities_V1({super.key});

  @override
  Widget build(BuildContext context) {
    VolatileChildren child = Provider.of<VolatileChildren>(context);
    final String level = getLevel(child.value.pontuation)["level"];
    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        appBar: AppBar(
            backgroundColor: const Color(0xFFFFFFFF),
            toolbarHeight: 160,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.fromLTRB(16, 64, 16, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.blue,
                          ),
                          //color: Colors.blue,
                          height: 88,
                          width: MediaQuery.sizeOf(context).width * 0.6 - 24,
                          padding: const EdgeInsets.all(16),
                          child: Text(level,
                              style: CoinnyTextStyles.body_2_medium())),
                      Positioned(
                        child: Image.asset(
                          "assets/images/levels/${level.toLowerCase()}.png",
                          height: 88,
                        ),
                        bottom: 0,
                        right: 0,
                      )
                    ],
                  ),
                  Container(
                      height: 88,
                      width: MediaQuery.sizeOf(context).width * 0.4 - 24,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: const Color(0xFFFBFBFB),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/appIcons/ranking.png",
                            height: 24,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "4 Lugar",
                                style: CoinnyTextStyles.body_3_semi_bold(
                                    color: CoinnyColors.textDarkPurple),
                              ),
                              Text(
                                "Ranking",
                                style: CoinnyTextStyles.footone_1_medium(
                                    color: CoinnyColors.textDarkPurple),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            )),
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [AnimatedColumns(blocks: [
  ActivitieBlock(imagePath: "assets/images/activities/planejar.png", state: 3, onPressed: () {
    print("\n\n\n ACTIVITIE BLOCK LAUNCHED \n\n\n");
    Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              ActivitieLauncher(child: child)));
  },),
  ActivitieBlock(imagePath: "assets/images/activities/metas.png", state: 3),
  ActivitieBlock(imagePath: "assets/images/activities/nece.png", state: 3),
  ActivitieBlock(imagePath: "assets/images/activities/poup.png", state: 3),
  ActivitieBlock(imagePath: "assets/images/activities/como.png", state: 3),
  ActivitieBlock(imagePath: "assets/images/activities/visao.png", state: 3),
])],
            )));
  }
}
