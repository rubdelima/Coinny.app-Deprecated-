import 'package:flutter/material.dart';
import 'package:learn/widgets/global/learnAppBar.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/monitoring/childrenMonitoringGraph.dart';
import 'package:learn/widgets/monitoring/childrenMonitoringSelector.dart';
import 'package:provider/provider.dart';


class MonitoringPage extends StatefulWidget {
  final ValueNotifier<double> pagePosition;
  
  MonitoringPage({
    required this.pagePosition, Key? key
    }) : super(key: key);


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
        heigth: 248,
        child: Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(14, 48, 14, 0),
            child: RichText(
                text: const TextSpan(
                    children: [
                  TextSpan(
                    text: 'Monitoramento\n\n',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  TextSpan(
                      text:
                          "Acompanhe o desempenho dos seus filhos em tempo real, visualize suas conquistas e comemorem juntos!",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 13))
                ],
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Fieldwork-Geo',
                    )))),
      ),
      body: SingleChildScrollView(
        
        child:Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
            children: [
              ChildSelect(
                isSelected: selectedChild == null,
                onTap: () => _onChildTap(null),
                child: null,
              ),
              ...parent.value.dependents
                  .map((child) => ChildSelect(
                        isSelected: selectedChild == child,
                        onTap: () => _onChildTap(child),
                        child: child,
                      ))
                  .toList(),
            ],
          ),),
          const SizedBox(height: 16,),
          const Text("XP da semana", style: TextStyle(fontFamily: "Fieldwork-Geo", color: Color(0xFF000000), fontWeight: FontWeight.bold,fontSize: 14),),
          const Text("Veja a quantidade de XP coletada ao longo da\nsemana pelos seus filhos.", style: TextStyle(fontFamily: "Fieldwork-Geo", color: Color(0xFF5c5c5c),fontSize: 12),),
          const SizedBox(height: 8,),
          Container(
            height: 280,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:  const Color(0xFFfffbfe),
              borderRadius: BorderRadius.circular(20),
              boxShadow:  [BoxShadow(
                color: const Color(0xFF5C5C5C).withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 0),
              )]
            ) ,
            child:ChildrenMonitoringGraph(
            children: parent.value.dependents,
            selectedChild: selectedChild,
          ),
          ),
          const SizedBox(height: 16,),
          const Text("Relatório de desempenho", style: TextStyle(fontFamily: "Fieldwork-Geo", color: Color(0xFF000000), fontWeight: FontWeight.bold,fontSize: 14),),
          const Text("Gere um relatório de desempenho de todos os seus dependentes.", style: TextStyle(fontFamily: "Fieldwork-Geo", color: Color(0xFF5c5c5c),fontSize: 12),),
          const SizedBox(height: 8,),
          Container(
            height: 119,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:  const Color(0xFFA2A2A2).withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
              boxShadow:  [BoxShadow(
                color: Color(0xFF5C5C5C).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset:  Offset(1, 1),
              )]
            ),
            child: Center(
                  child: Image.asset(
                "assets/images/appIcons/icon-lock-default.png",
                height: 119 * 0.25)
            )
          ),

          const SizedBox(height: 120,)
        ],
      ),
      ),)

    );
  }
}
