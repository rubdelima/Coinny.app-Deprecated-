import 'package:flutter/material.dart';
import '/utils/acheiviementsList.dart';
import 'dart:ui';

class AchievementIcon extends StatelessWidget {
  final int achievmentId;
  final DateTime conclusionDate;
  final double heigth;
  final double width;
  final bool isLocked;

  AchievementIcon(
      {required this.achievmentId,
      required this.conclusionDate,
      required this.heigth,
      required this.width,
      this.isLocked = false});

  @override
  Widget build(BuildContext context) {
    final AchivievementData data = achievementsList[achievmentId];
    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.5), // Arredondamento das bordas
      ),
      child: Stack(
        children: [
          Container(
            width: width,
            height: heigth,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: data.colors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius:
                    BorderRadius.circular(12.5), // Arredondamento das bordas
                ),
            child: Stack(
              children: [
                Center(
                    child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset(
                    data.imagePath,
                    height: heigth,
                  ),
                )),
                Positioned(
                  left: 5.0,
                  right: 5.0,
                  bottom: 5.0,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(children: [
                          Container(
                              child: Image.asset(
                                  'assets/images/appIcons/icon-award.png',
                                  height: 15)),
                          const SizedBox(width: 3),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.nome,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 11.75,
                                      fontFamily: 'Fieldwork-Geo',
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${conclusionDate.day}/${conclusionDate.month}/${conclusionDate.year}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontFamily: 'Fieldwork-Geo',
                                      fontWeight: FontWeight.w300),
                                ),
                              ])
                        ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          if (isLocked)
            Container(
              height: heigth,
              width: width,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.92),
                borderRadius: BorderRadius.circular(12.5),
              ),
              child: Center(
                  child: Image.asset(
                "assets/images/appIcons/icon-lock-default.png",
                height: heigth * 0.1,
              )),
            )
        ],
      ),
    );
  }
}
