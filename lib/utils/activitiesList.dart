import 'package:flutter/material.dart';
import 'package:learn/classes.dart';

const List<Activitie> activitiesList = [
  Activitie(
    id : 0,
    title: "Passeando no Shopping",
    description: "Você está saindo com seus amigos para o Shopping com puco dinheiro.",
    backgroundColors: [Color(0xFFDA59AE), Color(0xFF4912A2)],
    iconPath: "assets/images/appIcons/activityIcon1.png",
    lessions: [0,1,2]
  ),
  Activitie(
    id : 1,
    title: "Comprando novos jogos",
    description: "Seus amigos estão comprando jogos que estão entrando na moda e você quer participar",
    backgroundColors: [Color(0xFF59D2DA), Color(0xFF1232A2)],
    iconPath: "assets/images/appIcons/activityIcon2.png",
    lessions: [0,1,2]
  ),
  Activitie(
    id : 2,
    title: "Comprando novos jogos",
    description: "Seus amigos estão comprando jogos que estão entrando na moda e você quer participar",
    backgroundColors: [Color(0xFF59D2DA), Color(0xFF1232A2)],
    iconPath: "assets/images/appIcons/activityIcon4.png",
   lessions: [0,1,2]
  ),
   Activitie(
    id : 3,
    title: "Comprando novos jogos",
    description: "Seus amigos estão comprando jogos que estão entrando na moda e você quer participar",
    backgroundColors: [Color(0xFF59D2DA), Color(0xFF1232A2)],
    iconPath: "assets/images/appIcons/activityIcon3.png",
    lessions: [0,1,2]
  )
];

double getProgress(int activitieId, List<int> progress){
  if (activitieId > activitiesList.length){return 0;}
  return 100 * progress.length/(activitiesList[activitieId].lessions.length);
}