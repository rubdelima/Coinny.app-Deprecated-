import 'package:flutter/material.dart';
import 'package:learn/components.dart';
import 'package:learn/classes.dart';

class Sugestion_01 extends StatelessWidget {
  final Children children;

  Sugestion_01({required this.children, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.sizeOf(context).width - 32,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color(0xFF4B50C0),
                  borderRadius: BorderRadius.circular(10)),
              child: RichText(
                  text: TextSpan(
                      children: [
                    const TextSpan(
                        text: "Aprendizado da seção\n",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    const WidgetSpan(child: SizedBox(height: 32)),
                    TextSpan(
                      text:
                          "O ${children.name} recentemente concluiu a tarefa de ",
                    ),
                    const TextSpan(
                        text: "Orçamento de um passeio no Shopping ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const TextSpan(
                        text:
                            "do Coinny, e aprendeu os seguintes conceitos:\n"),
                    const WidgetSpan(child: SizedBox(height: 32)),
                    const TextSpan(
                        text:
                            " *  Pesquisa de preços dos produtos desejados\n"),
                    const TextSpan(text: " *  Criação de orçamentos\n"),
                    const TextSpan(
                        text: " *  Lidando com imprevistos no orçamento\n"),
                  ],
                      style: const TextStyle(
                          fontSize: 12,
                          fontFamily: "Fieldwork-Geo",
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF)))),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: const TextSpan(
                  children: [
                    TextSpan(text: "Ele agora é capaz de "),
                    TextSpan(
                        text:
                            "comparar preços para tomada de decisão, criar orçamentos simples e considerar imprevistos durante esse processo de criação!",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "Mas é importante sempre praticar - e por que não fazer isso em família?"),
                  ],
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Fieldwork-Geo",
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF000000))),
            ),
            const SizedBox(height: 32),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                height: 48,
                width: 56,
                child: Image.asset(
                  "assets/images/appImages/AppIconBalloon.png",
                  height: 48,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 108,
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text:
                                  "Então aqui vai um desafio: Planeje, junto com o ${children.name}, o "),
                          const TextSpan(
                              text: "Orçamento de um passeio em família!\n",
                              style: TextStyle(
                                  color: Color(0xFF282C93),
                                  fontWeight: FontWeight.bold)),
                          const TextSpan(
                              text: "Não se preocupe, a gente te ajuda :)")
                        ],
                        style: const TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: "Fieldwork-Geo")),
                    textAlign: TextAlign.justify),
              ),
            ]),
            const SizedBox(height: 54),
            Container(
              alignment: Alignment.centerLeft,
              width: MediaQuery.sizeOf(context).width - 32,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color(0xFF4B50C0),
                  borderRadius: BorderRadius.circular(10)),
              child: RichText(
                text: const TextSpan(children: [
                  TextSpan(
                      text: "Sugestão de Atividade\n",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          fontFamily: "Fieldwork-Geo")),
                  WidgetSpan(child: SizedBox(height: 24)),
                  TextSpan(
                      text: "Orçamento de um passeio em família",
                      style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          fontFamily: "Fieldwork-Geo")),
                ]),
                //textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 40),
            const NumberBlock(number: 1, text: [
              TextSpan(
                  text: "Definir com o seu filho qual o local do passeio\n",
                  style: TextStyle(
                      color: Color(0xFF282C93), fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      "Escolha qualquer local que seja divertido para um passeio em família! Vamos exemplificar com um passeio a um restaurante, está bem?")
            ]),
            const SizedBox(height: 24),
            const NumberBlock(number: 2, text: [
              TextSpan(
                  text: "Escolher o destino:\n ",
                  style: TextStyle(
                      color: Color(0xFF282C93), fontWeight: FontWeight.bold)),
              TextSpan(
                  text:
                      "Vocês vão a um restaurante - mas qual restaurante? E aí vem a etapa de pesquisa! Procure um espaço legal, com uma boa comida e que esteja em uma faixa de preço que cabe no bolso da família\n\n"),
              TextSpan(
                  text:
                      'Dica: Quando a gente pesquisa o nome de um restaurante no Google ele indica a faixa de preço do estabelecimento',
                  style: TextStyle(color: Color(0xFF3034AD), fontSize: 11))
            ]),
            const SizedBox(height: 24),
            const NumberBlock(number: 3, text: [
              TextSpan(
                  text: "Mapear os custos.\n",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF282C93))),
              TextSpan(
                  text:
                      "Ou seja, colocar na ponta do lápis os gastos com o restaurante, assim como os gastos estimados com transporte, por exemplo!\n\nSe a faixa de preço do restaurante for, por exemplo, R\$40-R\$60, o preço médio dos pratos costuma variar entre R\$40 e R\$60, e portanto, o ideal é"),
              TextSpan(
                  text:
                      " considerar o valor mais alto para evitar imprevistos.",
                  style: TextStyle(color: Color(0xFF3034AD)))
            ]),
            const SizedBox(height: 24),
            const NumberBlock(number: 4, text: [
              TextSpan(
                  text: "Replanejem se for preciso!\n",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF282C93))),
              TextSpan(
                  text:
                      "Caso o orçamento estimado fique alto demais, replanejar é uma ótima ideia.\n\nE só lembrando, montar um orçamento não significa que tudo o que foi estimado vai ser gasto, mas que vocês terão mais controle sobre o quanto gastarão."),
            ]),
            const SizedBox(height: 32),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                width: 56,
              ),
              SizedBox(
                height: 48,
                width: 56,
                child: Image.asset(
                  "assets/images/appImages/AppIconBalloon.png",
                  height: 48,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 212,
                child: RichText(
                    text: const TextSpan(
                        text:
                            "É isso! Sucesso na sua jornada orçamentária - esperamos que se divirtam no processo!",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            fontFamily: "Fieldwork-Geo")),
                    textAlign: TextAlign.justify),
              ),
            ]),
          ],
        );
  }
}