import 'package:flutter/material.dart';

class PageType1 {
  RichText text;
  bool isHappy;

  PageType1({
    required this.text,
    required this.isHappy,
  });
}

class PageType2 {
  RichText text;
  RichText preOptions;
  List<String> options;
  List<String> ballonPath;
  int correct;

  PageType2(
      {required this.text,
      required this.preOptions,
      required this.options,
      required this.ballonPath,
      required this.correct});
}

const preOptionsStyle = TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontFamily: "Fieldwork-Geo",
                      fontWeight: FontWeight.normal,
                    );

const preOptionsBoldStyle = TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Fieldwork-Geo",
                      fontWeight: FontWeight.bold,
                    );


PageType1 pg1 = PageType1(
    text: RichText(
      text: const TextSpan(
          children: [
            TextSpan(
              text: "Oi ",
            ),
            TextSpan(
              text: "Luciano",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: "! Sua mascote, a "),
            TextSpan(
                text: "Connie", style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ", está com um problema e só você pode resolvê-lo!"),
          ],
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: "Fieldwork-Geo")),
      textAlign: TextAlign.center,
    ),
    isHappy: false);

PageType1 pg2 = PageType1(
    text: RichText(
      text: const TextSpan(
        children: [
          TextSpan(text: "Connie", style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: " quer muito ir ao "),
          TextSpan(text: "cinema", style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: " com seus amigos, mas para isso, ela precisa montar um  "),
          TextSpan(text:"orçamento", style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: " para o passeio e ela não sabe como fazer isso!\n\n"),
          TextSpan(text: "Você está pronta para ajudá-la?", style: TextStyle(fontWeight: FontWeight.bold))
        ],
        style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: "Fieldwork-Geo")),
      textAlign: TextAlign.center,
    ),
    isHappy: false);

PageType2 pg3 = PageType2(
    text: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text:
                'Ela e seus amigos já escolheram o filme que vão assistir mas para montar o orçamento, a ',
          ),
          TextSpan(
            text: "Connie ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: 'ainda precisa escolher o '),
          TextSpan(
            text: "tipo do ingresso ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'que vai comprar e ',
          ),
          TextSpan(
            text: "qual lanche vai querer. ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
        style: preOptionsStyle,
      ),
      textAlign: TextAlign.center,
    ),
    preOptions: RichText(
      text: const TextSpan(
          children: [
            TextSpan(
              text: 'O que você acha que ela deveria fazer',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            TextSpan(
              text: " primeiro?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
          style: preOptionsStyle),
    ),
    options: [
      "Levar todo o dinheiro do seu cofrinho",
      "Pesquisar quais são os preços dos opções de ingresso e lanche, e quais cinemas estão disponíveis",
      "Levar R\$50 e não pesquisar os preços das atividades que vai querer fazer"
    ],
    correct: 1,
    ballonPath: [1,2,3].map((e) => "assets/images/ballons/pg3-a$e.png").toList()
    );

PageType1 pg4 = PageType1(
  text: RichText(
    text: const TextSpan(
      children: [
        TextSpan(text: "Ótima ideia Luciano, Connie fez a pesquisa dos ingressos primeiro e e encontrou isso aqui:"),
      ],
      style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: "Fieldwork-Geo")),
    textAlign: TextAlign.center,
  ), 
  isHappy: true);

PageType2 pg5 = PageType2(
    text: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Ela ',
          ),
          TextSpan(
            text: "não faz questão ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text:
                'de que o filme seja 3D, e pode dividir os ingressos com mais 2 amigos!',
          ),
        ],
        style: preOptionsStyle,
      ),
      textAlign: TextAlign.center,
    ),
    preOptions: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Qual opção ',
          ),
          TextSpan(
            text: "você acha ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: 'que seria o ',
          ),
          TextSpan(
            text: 'melhor?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        style: preOptionsStyle,
      ),
    ),
    options: [
      "Ingresso normal - R\$20",
      "Ingresso 3D - R\$25",
      "Combo: 3 ingressos normais - R\$45"
    ],
    correct: 2,
    ballonPath: [1,2,3].map((e) => "assets/images/ballons/pg5-a$e.png").toList()
    );

PageType1 pg6 = PageType1(
  text: RichText(
    text: const TextSpan(
      children: [
        TextSpan(text: "Perfeito! Agora vamos ver a pesquisa dos lanches que a Connie fez:"),
      ],
      style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: "Fieldwork-Geo")),
    textAlign: TextAlign.center,
  ), 
  isHappy: true);

PageType2 pg7 = PageType2(
    text: RichText(
      text: const TextSpan(
        children: [
          TextSpan(
            text:
                'A Connie não tem certeza do que vai estar com vontade de comer durante o filme, mas quer um lanche delicioso e quer também ',
          ),
          TextSpan(
            text: "economizar no passeio.",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
        style: preOptionsStyle,
      ),
      textAlign: TextAlign.center,
    ),
    preOptions: RichText(
      text: const TextSpan(
        text: 'Qual opção de lanchonete ela deveria escolher?',
        style: preOptionsStyle,
      ),
    ),
    correct : 1,
    options : [
      "Lanchonete 1 (\$\$\$): Vende comidinhas artesanais e deliciosas que custam entre R\$40 e R\$60",
      "Lanchonete 2 (\$): Vende comidinhas que às vezes não estão tão boas, mas que custam R\$10 e R\$20",
      "Lanchonete 3(\$\$): Vende comidinhas bonitas e deliciosas que custam entre R\$20 e R\$40"
    ],
    ballonPath: [1,2,3].map((e) => "assets/images/ballons/pg7-a$e.png").toList()
);

PageType1 pg8 = PageType1(
  text: RichText(
    text: const TextSpan(
      children: [
        TextSpan(text: "Nessa lanchonete, existem 3 tipos de lanches com preços diferentes: lanches de R\$20, lanches de R\$30 e lanches de R\$40. Bem, a Connie não tem como saber o que vai ter vontade de comer durante o filme, né? Mas "),
        TextSpan(text: "para garantir que ela vai ter dinheiro suficiente ", style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: "para escolher qualquer um dos 3 tipos de lanches... ")
      ],
      style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Fieldwork-Geo")),
    textAlign: TextAlign.center,
  ), 
  isHappy: true);

PageType2 pg9 = PageType2(
  text: RichText(text:const  TextSpan(text: "")), 
  preOptions: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Quanto em dinheiro ela deveria levar para lanchar?',
                    style: preOptionsBoldStyle,
                  ),
                ],
              ),
            ), 
  options: ["R\$20", "R\$30", "R\$40"], 
  correct: 2,
  ballonPath: [1,2,3].map((e) => "assets/images/ballons/pg9-a$e.png").toList()
);

PageType1 pg10 = PageType1(
  text: RichText(
    text: const TextSpan(
      children: [
        TextSpan(text: "Legal! Mas imagina se quando a Connie chegasse no cinema, o "),
        TextSpan(text: "preço ", style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: "de todos os "),
        TextSpan(text: "ingressos ", style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text:" tivessem ",),
        TextSpan(text:"aumentado",style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text:"? É importante ela se planejar para ",),
        TextSpan(text:"imprevistos",style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text:" também!",),
      ],
      style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.w400,
            fontFamily: "Fieldwork-Geo")),
    textAlign: TextAlign.center,
  ), 
  isHappy: true);

PageType2 pg11 = PageType2(
 text: RichText(text:const  TextSpan(text: "")),
 preOptions: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'O que você aconselha a ela?',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 24,
                      fontFamily: "Fieldwork-Geo",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            options: ["Levar uma quantia dinheiro a mais, caso ela precise em uma emergência",
        "Levar somente o valor do ingresso e do lanche que ela pesquisou antes de sair de casa",
        "Não vão acontecer imprevistos, vamos apostar!"],
  correct: 0,
  ballonPath: [1,2,3].map((e) => "assets/images/ballons/pg11-a$e.png").toList()
);

PageType1 pg12 = PageType1(
  text: RichText(
    text: const TextSpan(
      children: [
        TextSpan(text: "Excelente, Luciano!"),
      ],
      style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.w700,
            fontFamily: "Fieldwork-Geo")),
    textAlign: TextAlign.center,
  ), 
  isHappy: true);

PageType2 pg13 = PageType2(
  text: RichText(text:const  TextSpan(text: "")),
  preOptions: RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'E ',
                  ),
                  TextSpan(
                    text: "quanto de dinheiro extra ",
                    style: TextStyle(fontWeight: FontWeight.bold,),
                  ),
                  TextSpan(
                    text: 'você aconselha a Connie a levar?'
                  ),
                  ],
                  style: preOptionsStyle
              ),
              textAlign: TextAlign.center,
            ),
  options: ["R\$5", "R\$20", "R\$200"],
  correct: 1,
  ballonPath: [1,2,3].map((e) => "assets/images/ballons/pg11-a$e.png").toList()
);