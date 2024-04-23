import 'package:flutter/material.dart';
import 'package:learn/pages/activities/lessionsModels/questionPage.dart';
import 'package:learn/pages/activities/lessionsModels/mascotPage.dart';
import 'package:learn/pages/activities/lessionsModels/completedActivityPage.dart';
import 'package:learn/pages/activities/lessionsModels/newConquist.dart';
import 'package:learn/utils/modelsClass.dart';
import 'pageTexts.dart';


double stringRealToDouble(String input) {
  RegExp regex = RegExp(r'R\$\s?(\d{1,3}(\.\d{3})*|\d+)(,\d{2})?');
  Iterable<RegExpMatch> matches = regex.allMatches(input);
  if (matches.isEmpty) return 0.0;
  String lastMatch = matches.last.group(0)!;
  String cleanedValue = lastMatch
      .replaceAll('R\$', '')
      .trim()
      .replaceAll(',', '.')
      .replaceAll('.', '');
  double value = double.parse(cleanedValue);
  return value;
}

class Lession01Main extends StatefulWidget {
  final VolatileChildren children;

  Lession01Main({Key? key, required this.children}) : super(key: key);

  @override
  _Lession01MainState createState() => _Lession01MainState();
}

class _Lession01MainState extends State<Lession01Main> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  ValueNotifier<double> pagePosition = ValueNotifier(0.0);
  List<dynamic> respostas = ["pg3", "pg5", "pg7", "pg9", "pg11", "pg13"];
  Map<String, num> escolhas = {
    "ingresso": 0.0,
    "lanche": 0.0,
    "extra": 0.0,
    "total": 0.0
  };
  List<dynamic> gabarito = [
    "Pesquisar quais são os preços dos opções de ingresso e lanche, e quais cinemas estão disponíveis",
    "Combo: 3 ingressos normais - R\$45",
    "Lanchonete 2 (\$): Vende comidinhas que às vezes não estão tão boas, mas que custam R\$10 e R\$20",
    "R\$40",
    "Levar uma quantia dinheiro a mais, caso ela precise em uma emergência",
    "R\$20",
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pageOptions = [
      MascotPage(
        pageController: _pageController,
        text: RichText(
          text: TextSpan(
              children: [
                const TextSpan(
                  text: "Oi ",
                ),
                TextSpan(
                  text: widget.children.value.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: "! Sua mascote, a "),
                const TextSpan(
                    text: "Connie",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const TextSpan(
                    text: ", está com um problema e só você pode resolvê-lo!"),
              ],
              style: const TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Fieldwork-Geo")),
          textAlign: TextAlign.center,
        ),
        isHappy: true,
      ),
      MascotPage(
          pageController: _pageController, text: pg2.text, isHappy: false),

      QuestionPage(
          pageController: _pageController,
          questionText: pg3.text,
          preOptionsText: pg3.preOptions,
          options: pg3.options,
          correctIndex: pg3.correct,
          responsePath: pg3.ballonPath,
          onSelectedOptionChange: (str) {
            respostas[0] = str;
          }),

      MascotPage(
          pageController: _pageController,
          text: RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                      text:
                          "Ótima ideia ${widget.children.value.name}, Connie fez a pesquisa dos ingressos primeiro e e encontrou isso aqui:"),
                ],
                style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Fieldwork-Geo")),
            textAlign: TextAlign.center,
          ),
          isHappy: true),

      QuestionPage(
        pageController: _pageController,
        questionText: pg5.text,
        preOptionsText: pg5.preOptions,
        options: pg5.options,
        correctIndex: pg5.correct,
        responsePath: pg5.ballonPath,
        onSelectedOptionChange: (str) {
          respostas[1] = str;
          escolhas["ingresso"] = stringRealToDouble(str);
          escolhas["total"] =
              escolhas['ingresso']! + escolhas['lanche']! + escolhas['extra']!;
        },
      ),

      MascotPage(
          pageController: _pageController, text: pg6.text, isHappy: true),

      QuestionPage(
        pageController: _pageController,
        questionText: pg7.text,
        preOptionsText: pg7.preOptions,
        options: pg7.options,
        correctIndex: pg7.correct,
        responsePath: pg7.ballonPath,
        onSelectedOptionChange: (str) {
          respostas[2] = str;
        },
      ),

      MascotPage(
          pageController: _pageController, text: pg8.text, isHappy: true),

      QuestionPage(
        pageController: _pageController,
        questionText: pg9.text,
        preOptionsText: pg9.preOptions,
        options: pg9.options,
        correctIndex: pg9.correct,
        responsePath: pg9.ballonPath,
        onSelectedOptionChange: (str) {
          respostas[3] = str; // Dinheiro do lanche
          escolhas["lanche"] = stringRealToDouble(str);
          escolhas["total"] =
              escolhas['ingresso']! + escolhas['lanche']! + escolhas['extra']!;
        },
      ),

      MascotPage(
          pageController: _pageController, text: pg10.text, isHappy: true),

      QuestionPage(
        pageController: _pageController,
        questionText: pg11.text,
        preOptionsText: pg11.preOptions,
        options: pg11.options,
        correctIndex: pg11.correct,
        responsePath: pg11.ballonPath,
        onSelectedOptionChange: (str) {
          respostas[4] = str;
        },
      ),

      MascotPage(
          pageController: _pageController,
          text: RichText(
            text: TextSpan(
                children: [
                  TextSpan(text: "Excelente, ${widget.children.value.name}!"),
                ],
                style: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Fieldwork-Geo")),
            textAlign: TextAlign.center,
          ),
          isHappy: true),

      QuestionPage(
        pageController: _pageController,
        questionText: pg13.text,
        preOptionsText: pg13.preOptions,
        options: pg13.options,
        correctIndex: pg13.correct,
        responsePath: pg13.ballonPath,
        onSelectedOptionChange: (str) {
          respostas[5] = str; // Dineiro extra
          escolhas["extra"] = stringRealToDouble(str);
          escolhas["total"] =
              escolhas['ingresso']! + escolhas['lanche']! + escolhas['extra']!;
        },
      ),
      MascotPage(
        pageController: _pageController,
        text: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    "Boa, ${widget.children.value.name}! Agora, vamos só conferir quanto a Connie deveria levar para o passeio, no total? Aqui a lista dela:\n\n",
              ),
              TextSpan(
                text: "Ingresso - R\$${escolhas['ingresso']}\n",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "Lanche - R\$${escolhas['lanche']}\n",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text:
                    "Dinheiro extra para imprevistos - R\$${escolhas['extra']}\n\n",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: "Ou seja, no total ela vai levar ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: "R\$${escolhas['total']}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: " para o passeio!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
            style: const TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Fieldwork-Geo"),
          ),
          textAlign: TextAlign.center,
        ),
      ),

      FinalPage(pageController: _pageController,
      children: widget.children,
      percentage: _correctQuestions(),
      ),

      ConquistPage(children: widget.children)

    ];

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _pageOptions,
      ),
    );
  }

  double _correctQuestions(){
    int correct = 0;
    for(int i = 0; i < respostas.length; i++){
      if(respostas[i] == gabarito[i]){
        correct++;
      }
    }
    return correct/respostas.length;
  }
}
