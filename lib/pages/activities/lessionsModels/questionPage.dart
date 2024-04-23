import 'package:flutter/material.dart';
import 'package:learn/widgets/global/backButton.dart';
import 'package:learn/widgets/global/commonButton.dart';
import 'package:learn/widgets/lessions/questionRadioTile.dart';

class QuestionPage extends StatefulWidget {
  final PageController pageController;
  final RichText questionText;
  final RichText preOptionsText;
  final List<String> options;
  final List<String> responsePath;
  final int correctIndex;
  final ValueChanged<String> onSelectedOptionChange;

  QuestionPage({
    required this.pageController,
    required this.questionText,
    required this.preOptionsText,
    required this.options,
    required this.responsePath,
    required this.correctIndex,
    required this.onSelectedOptionChange,
  });

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int selecionada = -1;
  bool marked = false;
  OverlayEntry? _overlayEntry;
  List<LayerLink> links = [];

  @override
  void initState() {
    super.initState();
    // Inicialize um LayerLink para cada opção
    links = List.generate(widget.options.length, (_) => LayerLink());
  }

  @override
  void dispose() {
    // Certifique-se de remover o OverlayEntry ao descartar o widget
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0XFF646AE3),
                Color(0XFF262B91),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 120,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height - 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  widget.questionText,
                  const SizedBox(height: 32,),
                  _buildQuestion(context),
                ],
              ),
            )
          ]),
        ),
        Positioned(
            top: 88,
            left: 16,
            child: LearnBackButton(
              buttonColor: const Color(0xFFFFFFFF),
              iconColor: const Color(0xff101573),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        Positioned(
          bottom: 120,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LearnButton(
                  text: const Text(
                    "Voltar",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Fieldwork-Geo",
                    ),
                  ),
                  buttonColor: const Color(0x00000000),
                  width: 120,
                  onPressed: () {
                    widget.pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                ),
                const Spacer(),
                LearnButton(
                  borderRadius: 25,
                  text: const Text(
                    "Continuar",
                    style: TextStyle(
                      color: Color(0xff101573),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Fieldwork-Geo",
                    ),
                  ),
                  buttonColor:  const Color(0xFFFFFFFF).withOpacity(selecionada == -1 ? 0.3 : 1),
                  borderColor: const Color(0xFFFFFFFF).withOpacity(selecionada == -1 ? 0.3 : 1),
                  width: 120,
                  onPressed: marked? () {
                    widget.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  }: null,
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildQuestion(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: widget.preOptionsText,
        ),
        Column(
          children: widget.options.asMap().entries.map((entry) {
            int idx = entry.key;
            String text = entry.value;
            if (selecionada == idx){
              marked = true;
            }
            return _buildOption(idx, text, context);
          }).toList(),
        )
      ],
    );
  }

  Widget _buildOption(int index, String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: QuestionRadioTile(
        title: text,
        isSelected: selecionada == index,
        isCorrect: widget.correctIndex == index,
        link: links[index],
        onTap: () {
          setState(() {
            selecionada = index;
            widget.onSelectedOptionChange(text);
          });
          _showBalloon(context, widget.responsePath[index], index);
          //(widget.correctIndex == index)? _showBalloon(context, "assets/images/appImages/correctBalloon.png", index): 
          //_showBalloon(context, "assets/images/appImages/wrongBalloon.png", index);
        },
      ),
    );
  }

  void _showBalloon(BuildContext context, String photoPath, int index) {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: 0.9*MediaQuery.of(context).size.width,
          child: CompositedTransformFollower(
            link: links[index],
            showWhenUnlinked: false,
            offset: Offset(44, -90), // Offset ajusta a posição Y do balão
            child: Material(
              color: Colors.transparent,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(photoPath), // Usa a imagem para o balão
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!); // Insere a sobreposição na árvore de widgets

  }
}
