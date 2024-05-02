import "package:flutter/material.dart";
import "package:learn/classes.dart";
import 'package:learn/pages/parents/sugestion.dart';

class ShowSugestion extends StatelessWidget {
  final double width;
  final Children children;
  final String activitieName;

  ShowSugestion(
      {required this.width,
      required this.children,
      required this.activitieName,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      width: width,
      decoration: BoxDecoration(
          color: const Color(0xFF4B50C0),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Row(
          children: [
            Image.asset(
              "assets/images/appIcons/notification.png",
              width: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "Notificação da Coinny",
              style: TextStyle(
                  fontSize: 10,
                  color: const Color(0xFFFFFFFF).withOpacity(0.8),
                  fontFamily: "Fieldwork-Geo",
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ActivitiesSugestionPage(children: children)));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(8, 7, 8, 0),
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Text(
                    "Ver sugestão",
                    style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFFFFFFF),
                        fontFamily: "Fieldwork-Geo",
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
        const SizedBox(height: 8),
        RichText(
            text: TextSpan(
                children: [
              TextSpan(
                  text: children.name,
                  style: const TextStyle(fontWeight: FontWeight.w700)),
              const TextSpan(text: " finalizou a atividade de "),
              TextSpan(
                  text: activitieName,
                  style: const TextStyle(fontWeight: FontWeight.w700)),
              const TextSpan(
                  text:
                      ", que tal fazer uma atividade em conjunto para colocar o conhecimento do seu filho na prática?")
            ],
                style: const TextStyle(
                    fontFamily: "Fieldwork-Geo",
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFFFFFFF))))
      ]),
    );
  }
}
