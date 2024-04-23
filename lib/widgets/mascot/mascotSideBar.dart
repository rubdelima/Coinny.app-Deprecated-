
import 'package:flutter/material.dart';
import 'package:learn/widgets/mascot/mascotSideBarIcon.dart';
import 'package:learn/pages/parents/addDependentPage.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:provider/provider.dart';



class MascotSideBar extends StatelessWidget {
  final PageController pageController;

  MascotSideBar({required this.pageController});

  @override
  Widget build(BuildContext context) {
  VolatileChildren children = Provider.of<VolatileChildren>(context);
  return Positioned(
    left: 10,
    bottom: 50,
    child: Container(
      padding: const EdgeInsets.fromLTRB(1, 40,1, 40),
      width: 70,
      height: 375,
      alignment: Alignment.bottomLeft,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0.0,
              blurRadius: 10.0,
              offset: Offset(0, -1), 
            ),
          ],
        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MascotSideBarIcon(name:"Loja", onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddDependentPage())
              );
            }),
          MascotSideBarIcon(name:"Alimentos", onPressed: () {children.addPontuation(200);}),
          MascotSideBarIcon(name:"Atividades", onPressed: (){children.value.update();},),
          MascotSideBarIcon(name:"Roupas", onPressed: (){
              try{loadChildren(children.value.childrenCode);
              }catch(e) {print(e);}
          },),
        ],
      ),
    )
  );
  }
}