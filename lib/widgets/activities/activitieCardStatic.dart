import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn/utils/animatedProgressBar.dart';
import 'package:learn/utils/modelsClass.dart';
import 'dart:ui';

class ActivitieCardStatic extends StatelessWidget {
  final Activitie activitie;
  final double progress;
  bool isLocked;
  bool withProgress;


  ActivitieCardStatic({
    required this.activitie,
    this.isLocked = true,
    this.progress = 0,
    this.withProgress = false
  });

  @override
  Widget build(BuildContext context) {
    double widgetWidth = MediaQuery.of(context).size.width -28;
    return Stack(
      children: [
        Container(
            width: widgetWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: LinearGradient(
                colors: isLocked ? const [Color(0xFFC3C3C3), Color(0xFFC3C3C3)] : activitie.backgroundColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                       Image.asset(
                        activitie.iconPath?? 'assets/images/appIcons/activityIcon1.png',
                        height: MediaQuery.sizeOf(context).height*0.10,
                      ),
                      const SizedBox(width: 16,),
                      Column(
                        children: [
                          SizedBox (
                            width:  widgetWidth*( withProgress ? 0.6 : 0.45),
                             child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 4),
                                Text(
                                  activitie.title,
                                  style: const TextStyle(
                                    fontFamily: "Fieldwork-Geo",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                                Text(
                                  activitie.description,
                                  style: const TextStyle(
                                    fontFamily: "Fieldwork-Geo",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ],
                            )
                          ),
                        ],
                            ),
                      if (!withProgress) ...[
                        const Spacer(),
                        const Icon(Icons.chevron_right, color: Colors.white),
                      ],
                      
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (withProgress) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        gradient: LinearGradient(
                          colors: [Colors.white.withOpacity(0.3), Colors.white.withOpacity(0.1)],
                          begin: Alignment.topLeft,
                        )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: widgetWidth*0.70,
                            child: AnimatedProgressBar(
                              progress: progress,
                              maxProgress: 100,
                              barColor: Colors.white,
                              height: 6,
                            )
                          ),
                          const SizedBox(width: 2),
                          Text(
                            "${progress.ceil()} %",
                            style: const TextStyle(
                              fontFamily: "Fieldwork-Geo",
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF),
                            )
                          )
                      ],)
          
                    ),
                  ]
                ],
              ),
            ),
      ),
      if (isLocked) ...[
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                              child: Container(
                                alignment: Alignment.center,
                                color: Colors.black.withOpacity(0.6),
                                child: Image.asset(
                                  'assets/images/appIcons/icon-lock-default.png',
                                  color: Colors.white,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
      ]
    );
  }
}
