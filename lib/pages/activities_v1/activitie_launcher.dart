import 'package:flutter/material.dart';
import 'package:learn/widgets.dart';
import 'package:learn/components.dart';
import 'package:learn/utils.dart';
import 'package:percent_indicator/percent_indicator.dart';
import './newActivitieUtil.dart';

class ActivitieLauncher extends StatelessWidget {
  final VolatileChildren child;
  final int activitieID;
  const ActivitieLauncher(
      {required this.child, this.activitieID = 1, super.key});

  @override
  Widget build(BuildContext context) {
    final actv = getActivitie(activitieID);

    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 88, 16, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewBackButton(),
              const SizedBox(height: 32),
              SizedBox(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width*0.6,
                          child: Text(
                            actv.title,
                            style: CoinnyTextStyles.personalized(
                                color: CoinnyColors.textDarkPurple,
                                fontSize: 28,
                                fontWeigth: FontWeight.w500),
                          )),
                      Container(
                        child: CircularPercentIndicator(
                        radius: 40.0,
                        lineWidth: 8.0,
                        animation: true,
                        percent: 0.75,
                        center: Text(
                          "75%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor:
                            actv.color,
                        backgroundColor: const Color(0xFFf0f0f0),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    actv.description,
                      style: CoinnyTextStyles.body_2_medium(
                        color: CoinnyColors.textDarkPurple,
                      ))
                ],
              )),
              const SizedBox(height: 54,),
              InkWell(
                onTap: (){
                    Navigator.pushReplacementNamed(context, actv.route,
                      arguments: child);
                },
                child: Row(
                children: [
                  Container(
                    height: 184,
                    width: MediaQuery.sizeOf(context).width/2 - 24 ,
                    padding : const EdgeInsets.all(24),
                    decoration:BoxDecoration(
                      color: actv.color,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.play_arrow_rounded, 
                          color: Color(0xFFFFFFFF),
                          size: 40,
                          ),
                        Text("Iniciar Atividade", style: CoinnyTextStyles.body_3_medium(color: const Color(0xFFFFFFFF)))
                      ],
                    ),
                  )
                ],
              )),
            ],
          ),
        ));
  }
}
