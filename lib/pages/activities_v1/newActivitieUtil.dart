import 'package:flutter/material.dart';

class ActivitieUtil{
  final String title;
  final String description;
  final String route;
  final Color color;

  const ActivitieUtil({
    required this.title,
    required this.description,
    required this.route,
    required this.color
  });

}

const List<ActivitieUtil> newActivitiesList = [
  ActivitieUtil(
    title : "Aprendendo a se planejar",
    description : "Metas são essenciais para qualquer finanças, pois é mais fácil realizar algo pensando na mete do que apenas fazer por fazer.",
    route : "/lession01",
    color :  Color(0xFFcd64ff)
  )
];

ActivitieUtil getActivitie(int activitieId){
  if(activitieId < newActivitiesList.length){
    return newActivitiesList[activitieId];
  }
   return newActivitiesList[0];
}
