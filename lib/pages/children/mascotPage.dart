import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/mascot/mascote.dart';
import 'package:learn/widgets/mascot/mascotBar.dart';
import 'package:learn/widgets/mascot/mascotSideBar.dart';
import 'package:learn/widgets/global/globalProgressWidget.dart';
import 'package:provider/provider.dart';


class MascotPage extends StatelessWidget {

  final PageController pageController;


  MascotPage({
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    VolatileChildren child = Provider.of<VolatileChildren>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFBBD1E4),
      appBar: MascotBar(pageController: pageController),
      body: Stack(
        children: [
          Container(
             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25.0),
             child: GlobalProgress(pontuation: child.value.pontuation, name: "Coinny") 
          ),
          MascoteWidget(child: child.value),
          MascotSideBar(pageController: pageController),
        ],
      ),
    );
  }
}
