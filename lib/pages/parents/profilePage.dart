import 'package:flutter/material.dart';
import 'package:learn/widgets/profile/user-profile.dart';
import '/widgets/global/learnAppBar.dart';
import 'package:learn/widgets/monitoring/monitoramento.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/pages/parents/addDependentPage.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;
  final PageController pageController;

  ProfilePage(
      {required this.pagePosition,
      required this.pageController});

  @override
  Widget build(BuildContext context) {
    VolatileParents parent = Provider.of<VolatileParents>(context);
    return Scaffold(
      appBar: LearnAppBar(
        heigth: 248,
          pageIndex: 2,
          pagePosition: pagePosition.value,
          backButtonFunction: () {
            pageController.animateToPage(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 32),
            child: Column(children: [
              const Text(
                'Meu perfil',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              UserPhotoAndName(
                userName: parent.value.name,
                userPhotoPath: parent.value.photoPath,
                firstLine: "Seja bem-vindo,\n",
                fontWeight1: FontWeight.w400,
                secondLine: parent.value.name,
                fontWeight2: FontWeight.bold,
              ),
            ]),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: Column(children: [
            Row(
              children: [
                SizedBox(
                    width: (MediaQuery.sizeOf(context).width / 2) - 16,
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Dependentes\n',
                            style: TextStyle(
                              color: Color(0xFF222222),
                              fontSize: 14,
                              fontFamily: "Fieldwork-Geo",
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          WidgetSpan(
                            child: SizedBox(height: 16.0),
                          ),
                          TextSpan(
                            text:
                                'Altere as informações de seus dependentes sempre que precisar',
                            style: TextStyle(
                              color: Color(0xFF5C5C5C),
                              fontSize: 12,
                              fontFamily: "Fieldwork-Geo",
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    )),
                Spacer(),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddDependentPage()));
                    },
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                        height: 32,
                        width: 88,
                        decoration: BoxDecoration(
                            color: const Color(0xFFfffbfe),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow:  [
                              BoxShadow(
                                color: Color(0xFF5C5C5C).withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 0.5,
                                offset: const Offset(-1, 5),
                              )
                            ]),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 16,
                              color: Color(0xFF282C93),
                            ),
                            Text(
                              "Adicionar",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF282C93),
                                  fontFamily: "Fieldwork-Geo",
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )))
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: parent.value.dependents
                  .map((child) => ChildMonitoringBox(
                        child: child,
                      ))
                  .toList(),
            ),
          const SizedBox(height: 80,)
          ]
          ),
        ),
      ),
    );
  }
}
