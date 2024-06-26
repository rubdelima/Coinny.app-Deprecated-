import 'package:flutter/material.dart';
import 'package:learn/utils.dart';
import 'package:learn/components.dart';

class DependentMiniCard extends StatelessWidget {
  final Children children;

  const DependentMiniCard({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.only(right: 8, bottom: 8, top:8),
                height: 88,
                decoration: BoxDecoration(
                    color: const Color(0xFFFCFCFC),
                    borderRadius: BorderRadius.circular(24)),
                child: Row(
                  children: [
                    Image.asset(
                      children.photoPath,
                      width: 40,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(children.name,
                              style: CoinnyTextStyles.body_1_medium(
                                  color: CoinnyColors.textDarkPurple)),
                          Text(
                              "Ultima vez ativo à ${diffDays(children.lastAccsess ?? DateTime.now())} dias",
                              style: CoinnyTextStyles.footone_1_medium(),)
                        ]),
                  ],
                )),
            NewClassBadge(children: children)
          ],
        ));
  }
}