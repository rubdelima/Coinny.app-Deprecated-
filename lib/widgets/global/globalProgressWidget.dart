import 'package:flutter/material.dart';
import '/utils/animatedProgressBar.dart';
import '/utils/levelBarUtils.dart';

class GlobalProgress extends StatelessWidget {
  final bool isMascot;
  final BoxShadow? boxShadow;
  final int pontuation;
  final String name;

  GlobalProgress({
    required this.pontuation,
    this.name = "Nível Atual" ,
    this.isMascot = true,
    this.boxShadow,
  });

    @override
  Widget build(BuildContext context) {
    final currentLevel = getValues();
    final nextLevelPontuation = levelsPontuations.keys.firstWhere(
      (k) => k > pontuation,
      orElse: () => pontuation,
    );

    final textColor = isMascot ? const Color(0xFFFFFFFF) : const Color(0xFF040862);

    final finalBoxShadow = boxShadow ?? BoxShadow(
            color: textColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 16,
            offset: const Offset(0,0),
      );

    final barColors = isMascot ? boxesCollors[currentLevel['level'].toString()]??const [Color(0XFFFFFFFF), Color(0XFFFFFFFF)]
                               : const [Color(0XFFFFFFFF), Color(0XFFFFFFFF)];
    
    final progressPercentage = 100 * (pontuation - currentLevel['levelValue']) / (currentLevel['nextLevelValue'] - currentLevel['levelValue']);


    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [finalBoxShadow],
        gradient: LinearGradient(
          colors: barColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
          )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children : [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
                children : [
                    Text(
                      name,
                      style: TextStyle(
                        color: textColor, 
                        fontSize: isMascot ? 18 : 12, 
                        fontFamily: 'Fieldwork-Geo', 
                        fontWeight: isMascot? FontWeight.w600 : FontWeight.w300
                      ),
                    ),
                    Text(
                      '${currentLevel['level']} ${currentLevel['class']}',
                      style: TextStyle(
                        color: textColor, 
                        fontSize: isMascot ? 16 : 20, 
                        fontFamily: 'Fieldwork-Geo', 
                        fontWeight: isMascot? FontWeight.w400 : FontWeight.w600
                      ),
                    ),
                    Text(
                      '$pontuation XP/$nextLevelPontuation XP',
                      style: TextStyle(
                        color: textColor, 
                        fontSize: 10, 
                        fontFamily: 'Fieldwork-Geo', 
                        fontWeight: isMascot? FontWeight.w300 : FontWeight.w400
                      ),
                    ),
                ],
            ),
            const SizedBox(height: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                 Center(
                   child: Image.asset(
                     'assets/images/appIcons/badge-${currentLevel['level'].toString().toLowerCase()}-${isMascot ? "default" : "blue"}.png',
                     width: 72,
                   ),
                 ),
                 Container(
                    padding: const EdgeInsets.only(bottom: 5), 
                    child: Text(
                     '${currentLevel['class']}',
                     style: TextStyle(color: textColor, fontSize:32, fontFamily: 'Fieldwork-Geo', fontWeight: FontWeight.w800),
                    )
                 )
              ],
          ),
          ],
          ),
          
          const SizedBox(height: 8),
            if (!isMascot) // This will only display the AnimatedProgressBar if isMascot is true.
            AnimatedProgressBar(
              progress: progressPercentage.floorToDouble(),
              maxProgress: 100,
              barColor: textColor,
            ),
        ],
      ),
    );
  }

  Map<String, dynamic> getValues() {
    int selected = 0;
    levelsPontuations.keys.forEach((value) {
      if (value <= pontuation && value >= selected) {
        selected = value;
      }
    });
    return levelsPontuations[selected] ?? {'level' : 'Bronze', 'class' : 'I', 'nextLevelValue' : 200, 'levelValue': 0};
  }
}