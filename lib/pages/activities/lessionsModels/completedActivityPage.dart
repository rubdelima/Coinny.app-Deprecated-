import 'package:flutter/material.dart';
import 'package:learn/widgets/global/backButton.dart';
import 'package:learn/widgets/global/commonButton.dart';
import 'package:learn/widgets/lessions/lessionProgressBar.dart';
import 'package:learn/utils/modelsClass.dart';

class FinalPage extends StatelessWidget {
  final PageController pageController;
  final VolatileChildren children;
  final double percentage;

  FinalPage({
    required this.pageController,
    required this.children,
    required this.percentage,
  });

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
            Color(0XFF7A7FFF),
            Color(0XFF040862),
          ],
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 64,
            ),
            LearnBackButton(
              buttonColor: const Color(0xFFFFFFFF),
              iconColor: const Color(0xff101573),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Image.asset(
                "assets/images/mascote/mascot-${(percentage >= 0.7) ? 'happy' : 'sad'}.png",
                height: 240,
              ),
            ),
            const SizedBox(
              height: 64,
            ),
            Center(
                child: LessionProgressBar(
              percentage: percentage * 100,
            )),
            const SizedBox(
              height: 36,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: (percentage >= 0.7)
                        ? "Atividade Completa!\n\n"
                        : "Repita a Atividade\n\n",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextSpan(
                    text: (percentage >= 0.7)
                        ? "Parabéns por conseguir ajudar a Connie mais uma vez! Você fez excelentes escolhas, continue assim!"
                        : "Vamos tentar ajudar a Connie mais uma vez! Você fez boas escolhas, mas vamos tentar novamente!",
                  )
                ],
                style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Fieldwork-Geo"),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      Positioned(
          bottom: 120,
          child: LearnButton(
            text: Text(
              (percentage >= 0.7) ? "Continuar" : "Repetir",
              style: const TextStyle(
                color: Color(0xff101573),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Fieldwork-Geo",
              ),
            ),
            buttonColor: const Color(0xFFFFFFFF),
            onPressed: () {
              print(percentage);
              if ((percentage >= 0.7)) {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
                    return;
              }
              pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            },
          ))
    ]));
  }
}
