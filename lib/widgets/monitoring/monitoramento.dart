import 'package:flutter/material.dart';
import 'package:learn/pages/parents/individualChildMonitoring.dart';
import 'package:learn/utils/modelsClass.dart';

class MonitoringWidget extends StatelessWidget {
  final Parents parent;
  final String title;
  final String description;

  const MonitoringWidget(
      {required this.parent,
      this.title = "Monitoramento\n",
      this.description = 'Acompanhe o progresso de seus filhos.',
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Monitoramento\n',
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
                  text: 'Acompanhe o progresso de seus filhos.',
                  style: TextStyle(
                    color: Color(0xFF5C5C5C),
                    fontSize: 12,
                    fontFamily: "Fieldwork-Geo",
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16,),
        Column(
          children: parent.dependents
              .map((child) => ChildMonitoringBox(
                    child: child,
                  ))
              .toList(),
        )
      ],
    ));
  }
}

class ChildMonitoringBox extends StatelessWidget {
  final Children child;

  const ChildMonitoringBox({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChildMonitoringSpecific(
                        children: child,
                      )));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(child.photoPath, height: 54),
              ),
              const SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(child.name,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Fieldwork-Geo')),
                  Text('${diffYears(child.birthdate)} anos',
                      style: const TextStyle(
                          fontSize: 11, fontFamily: 'Fieldwork-Geo')),
                   Row(children: [
                    LevelBox(text: getLevel(child.pontuation)),
                    LevelBox(text: "${child.activities.length} trilhas concluídas"),
                  ])
                ],
              ),
              const Spacer(),
              Image.asset(
                "assets/images/appIcons/silver-badge.png",
                width: 54,
              )
            ],
          ),
        ));
  }
}

class LevelBox extends StatelessWidget {
  final String text;

  const LevelBox({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFfffbfe),
        borderRadius: BorderRadius.circular(3.75),
        boxShadow:  [
          BoxShadow(
            color: const Color(0xFFA9A9A9).withOpacity(0.3),
            spreadRadius: 0.01,
            blurRadius: 5,
            offset: const Offset(1, 3),
          )
        ],
      ),
      child: Text(text,
          style: const TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w400,
              fontFamily: 'Fieldwork-Geo')),
    );
  }
}
