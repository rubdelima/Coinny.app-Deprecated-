import 'package:flutter/material.dart';
import 'package:learn/components.dart';
import 'package:learn/widgets.dart';
import 'package:learn/classes.dart';
import 'package:provider/provider.dart';

final List<Block> blocks = [
      Block(title: 'Contas de casa', subtitle: 'Descrição 1', state: 3, blockColor: Colors.blue),
      Block(title: 'Mesada', subtitle: 'Descrição 2', state: 3, blockColor: Colors.grey),
      Block(title: 'Orçamento', subtitle: 'Descrição 3', state: 3, blockColor: Colors.green),
      Block(title: 'Poupança', subtitle: 'Descrição 4', state: 1, blockColor: Colors.blue),
      Block(title: 'Metas', subtitle: 'Descrição 5', state: 1, blockColor: Colors.blue),
    ];

class Activities_V1 extends StatelessWidget {
  const Activities_V1({super.key});

  List<Widget> activitiesGenerator(BuildContext context){
    List<Widget> activities = [];
    final w = MediaQuery.sizeOf(context).width;
    final w1 = (w-48) * 0.48;
    final w2 = (w-48) * 0.40;
    for (int i = 0; i < 10; i++){
      activities.add(Container(
            width: i%2 == 0? w1 :w2, 
            height: i%2 ==0 ? 40 : 120, 
            color: i%3 == 0 ? Colors.red : Colors.green,
          ));
    }
    return activities;
  }

  @override
  Widget build(BuildContext context) {
    VolatileChildren child = Provider.of<VolatileChildren>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        toolbarHeight: 160,
        flexibleSpace: 
        Container(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 0),
        child:
        GlobalProgress(
          pontuation: child.value.pontuation,
          isMascot: false,
        ),
        )
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 32,16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        AnimatedColumns(blocks: blocks)
      ],))

    );
  }
}

