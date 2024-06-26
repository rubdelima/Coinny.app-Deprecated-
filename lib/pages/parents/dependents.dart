import 'package:flutter/material.dart';
import 'package:learn/widgets.dart';
import 'package:learn/components.dart';
import 'package:learn/utils.dart';
import 'package:learn/pages/parents/new_edit_dependent.dart';

class DependentsPage extends StatelessWidget {
  final VolatileParents parent;
  const DependentsPage(this.parent, {super.key});

  @override
  Widget build(BuildContext context) {
    final List<DependentMiniCard> dependentsCards = parent
        .value.dependents.values
        .map((e) => DependentMiniCard(children: e))
        .toList();

    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 88, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewBackButton(),
              const SizedBox(height: 32),
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dependentes",
                        style: CoinnyTextStyles.personalized(
                            color: CoinnyColors.textDarkPurple,
                            fontSize: 28,
                            fontWeigth: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                          "Altere as informações de seus dependentes sempre que precisar.",
                          style: CoinnyTextStyles.body_2_medium(
                            color: CoinnyColors.suportTextGrey,
                          ))
                    ],
                  )),
              const SizedBox(height: 32),
              Column(children: dependentsCards),
              const SizedBox(height: 32),
              CoinnyGradientButton(
                title: "ADICIONAR DEPENDENTES",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddDependentPage(parent: parent)));
                },
              )
            ],
          ),
        ));
  }
}
