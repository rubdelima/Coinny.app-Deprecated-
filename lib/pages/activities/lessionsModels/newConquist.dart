import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn/widgets/global/backButton.dart';
import 'package:learn/widgets/global/commonButton.dart';
import 'package:learn/utils/modelsClass.dart';

class ConquistPage extends StatelessWidget {
  final VolatileChildren children;

  ConquistPage({required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(alignment: AlignmentDirectional.center, children: [
      Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Color(0XFF646AE3),
            Color(0XFF262B91),
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            LearnBackButton(
              buttonColor: const Color(0xFFFFFFFF),
              iconColor: const Color(0xff101573),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                height: MediaQuery.sizeOf(context).height - 360,
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/conquistas/new-conquist.png",
                        height: 240,
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Flexible(
                        child: RichText(
                      text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "Nova Conquista desbloqueada!\n\n",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                            TextSpan(
                                text:
                                    "Vá na página de conquistas para acompanhar seus reconhecimentos!")
                          ],
                          style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 16,
                            fontFamily: "Fieldwork-Geo",
                            fontWeight: FontWeight.w400,
                          )),
                      textAlign: TextAlign.center,
                    )),
                  ],
                )),
          ],
        ),
      ),
      Positioned(
          bottom: 120,
          child: LearnButton(
            text: const Text(
              "Finalizar",
              style: TextStyle(
                color: Color(0xff101573),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Fieldwork-Geo",
              ),
            ),
            buttonColor: const Color(0xFFFFFFFF),
            onPressed: () {
              children.addActivity();
              Navigator.pop(context);
            },
          ))
    ]));
  }
}
