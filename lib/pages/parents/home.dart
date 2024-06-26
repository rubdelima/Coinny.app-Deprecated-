import 'package:flutter/material.dart';
import 'package:learn/utils/fontstyles.dart';
import 'package:learn/widgets.dart';
import 'package:learn/components.dart';
import 'package:learn/classes.dart';
import 'package:learn/widgets/monitoring/New_Update_Card.dart';

import 'package:provider/provider.dart';

class ParentsHome extends StatelessWidget {
  final ValueNotifier<double> pagePosition;

  ParentsHome({
    required this.pagePosition,
  });

  @override
  Widget build(BuildContext context) {
    VolatileParents parent = Provider.of<VolatileParents>(context);

    return Scaffold(
      body: SingleChildScrollView(
        //padding: const EdgeInsets.fromLTRB(16,24,8,0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 54),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 24, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(parent.value.photoPath, height: 60),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Bom dia, ',
                                  style: FontStyles.body2MediumBlack,
                                ),
                                TextSpan(
                                  text: parent.value
                                      .name, // Substitua com o nome do usuário
                                  style: FontStyles.body2BoldBlack,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset('assets/images/appIcons/bell.png',
                      height: 24,
                      width: 24), // Substitua com o ícone de notificações
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Novas\n',
                        style: const TextStyle(
                          fontSize: 30,
                          fontFamily: 'Spartan',
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF060C20),
                        ),
                        children: [
                          TextSpan(
                            text: 'atualizações',
                            style: FontStyles.h2MediumBlack,
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 24, 0, 0),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NewUpdateCard(
                    title: 'Conclusão de módulo',
                    subtitle:
                        'O aluno finalizou o módulo de Orçamentos, que tal aprender juntos na prática?',
                    icon: 'assets/images/appIcons/money.png',
                    color: const Color(0xFFFF657D).withOpacity(0.8),
                  ),
                  const SizedBox(width: 16),
                  NewUpdateCard(
                    title: 'Nova conquista',
                    subtitle:
                        'O aluno alcançou uma conquista parabenize-o sobre o seu progresso!',
                    icon: 'assets/images/appIcons/medal.png',
                    color: const Color(0xFF5D61D6).withOpacity(0.8),
                  ),
                  const SizedBox(width: 16),
                  NewUpdateCard(
                    title: 'Avanço de nível',
                    subtitle:
                        'O aluno alcançou um novo nível, que tal comemorar com ele?',
                    icon: 'assets/images/appIcons/ray.png',
                    color: const Color(0xFFFFE061).withOpacity(0.8),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
