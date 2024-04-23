import "package:flutter/material.dart";

class AchivievementData{
  final int id;
  final String nome;
  final List<Color> colors;
  final String imagePath;

  AchivievementData({
    required this.id,
    this.nome= "",
    this.colors= const [ Color(0xFFFFFFFF)],
    this.imagePath= 'assets/images/appIcons/icon-trophie.png'
  });

}

List<AchivievementData> achievementsList = [
  AchivievementData(id: 0, nome: "Direto para o cofrinho!", colors: const [Color(0xFF59CBDA), Color(0xFF1E12A2)], imagePath: 'assets/images/conquistas/conquista-1.png'),
  AchivievementData(id: 1, nome: "Bit...? BitCoinie!", colors: const [Color(0xFFF9DA6F), Color(0xFFA24E12)], imagePath: 'assets/images/conquistas/conquista-2.png'),
  AchivievementData(id: 2, nome: "Poupança nunca mais!", colors: const [Color(0xFF59DAA4), Color(0xFF1277A2)], imagePath: 'assets/images/conquistas/conquista-3.png'),
  AchivievementData(id: 3, nome: "Responsa Habilidade!", colors: const [Color(0xFFDA59AE), Color(0xFF2F12A2)], imagePath: 'assets/images/conquistas/conquista-4.png'),
  AchivievementData(id: 4, nome: "Vamos para Disney!", colors: const [Color(0xFF82DA59), Color(0xFF1290A2)], imagePath: 'assets/images/conquistas/conquista-5.png'),
  AchivievementData(id: 5, nome: "InvestiMENTOS...", colors: const [Color(0xFFDA5959), Color(0xFF910B0B)], imagePath: 'assets/images/conquistas/conquista-6.png'),
];