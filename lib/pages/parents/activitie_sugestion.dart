import 'package:flutter/material.dart';
import 'package:learn/widgets.dart';
import 'package:learn/classes.dart';
import 'package:learn/utils.dart';
import 'package:learn/docs/sugestions.dart';

class ActivitiesSugestionPage extends StatelessWidget {
  final Children children;
  final int sugestionId;

  const ActivitiesSugestionPage({
    required this.children,
    required this.sugestionId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LearnAppBar(
          superWidget: ChildOverview(children),
          backButtonFunction: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
            child: CoinnyText(
              "Sugestão de Atividades",
              fontSize: 18, fontWeight: FontWeight.w700,
            ),
          )),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
          child: getSugestion(1, {'children': children})),
    );
  }
}
