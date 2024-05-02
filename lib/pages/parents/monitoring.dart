import 'package:flutter/material.dart';
import 'package:learn/classes.dart';
import 'package:learn/components.dart';
import 'package:learn/widgets.dart';
import 'package:provider/provider.dart';

class MonitoringPage extends StatefulWidget {
  final ValueNotifier<double> pagePosition;

  MonitoringPage({required this.pagePosition, Key? key}) : super(key: key);

  @override
  _MonitoringPageState createState() => _MonitoringPageState();
}

class _MonitoringPageState extends State<MonitoringPage> {
  Children? selectedChild;

  void _onChildTap(Children? child) {
    setState(() {
      selectedChild = child;
    });
  }

  @override
  Widget build(BuildContext context) {
    VolatileParents parent = Provider.of<VolatileParents>(context);
    return Scaffold(
        appBar: LearnAppBar(
          pageIndex: 2,
          pagePosition: widget.pagePosition.value,
          child: const CoinnyTitleSubTitlePage(
            title: 'Monitoramento',
            subTitle:
                "Acompanhe o desempenho dos seus filhos em tempo real, visualize suas conquistas e comemorem juntos!",
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      /// Todas as crianças
                      ChildSelect(
                        isSelected: selectedChild == null,
                        onTap: () => _onChildTap(null),
                        child: null,
                      ),

                      /// Um map para cada uma das crianças
                      ...parent.value.dependents.values
                          .toList()
                          .map((child) => ChildSelect(
                                isSelected: selectedChild == child,
                                onTap: () => _onChildTap(child),
                                child: child,
                              )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const CoinnyWidgetTitle(
                    title: "XP da semana",
                    description:
                        "Veja a quantidade de XP coletada ao longo da\nsemana pelos seus filhos."),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  height: 280,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color(0xFFfffbfe),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF5C5C5C).withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 0),
                        )
                      ]),
                  child: ChildrenMonitoringGraph(
                    children: parent.value.dependents.values.toList(),
                    selectedChild: selectedChild,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const PerformanceReportWidget(),
                const SizedBox(
                  height: 120,
                )
              ],
            ),
          ),
        ));
  }
}
