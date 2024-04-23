import 'package:flutter/material.dart';
import 'package:learn/widgets/global/backButton.dart';
import 'package:learn/widgets/global/commonButton.dart';

class MascotPage extends StatelessWidget {
  final PageController pageController;
  final String nextText;
  final bool isHappy;
  final RichText text;

  MascotPage(
      {required this.pageController,
      required this.text,
      this.isHappy = true,
      this.nextText = "Continuar"});

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
              height: 40,
            ),
            SizedBox(
                height: MediaQuery.sizeOf(context).height - 360,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: text),
                    Center(
                      child: Image.asset(
                        "assets/images/mascote/mascot-${isHappy ? 'happy' : 'sad'}.png",
                        height: 240,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      Positioned(
          bottom: 120,
          child: LearnButton(
            text: Text(
              nextText,
              style: const TextStyle(
                color: Color(0xff101573),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Fieldwork-Geo",
              ),
            ),
            buttonColor: const Color(0xFFFFFFFF),
            onPressed: () {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            },
          ))
    ]));
  }
}
