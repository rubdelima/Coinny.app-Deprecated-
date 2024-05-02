import 'package:flutter/material.dart';
import 'package:learn/classes.dart';
import 'package:learn/components.dart';
import 'package:learn/pages/parents/edit_dependent.dart';

class ProfileTitle extends StatelessWidget {
  final VolatileParents parent;
  const ProfileTitle({
    required this.parent,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: (MediaQuery.sizeOf(context).width / 2) - 16,
          child: const CoinnyWidgetTitle(
              title: 'Dependentes\n',
              description:
                  'Altere as informações de seus dependentes sempre que precisar'),
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddDependentPage(parent: parent)));
            },
            child: Container(
                padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
                height: 32,
                width: 88,
                decoration: BoxDecoration(
                    color: const Color(0xFFfffbfe),
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF5C5C5C).withOpacity(0.2),
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
    );
  }
}
