import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learn/classes.dart';
import 'package:learn/components/newBack_button.dart';
import 'package:learn/utils/fontstyles.dart';
import 'package:learn/widgets/login/loginAppBar.dart';
import 'package:learn/components/gradient_button.dart';
import 'package:learn/widgets/login/loginInfoContainter.dart';

class LoginChildPage extends StatefulWidget {
  const LoginChildPage({Key? key}) : super(key: key);

  @override
  LoginChildPageState createState() => LoginChildPageState();
}

class LoginChildPageState extends State<LoginChildPage> {
  List<String> values = List.filled(4, '');

  List<TextEditingController> controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );

  List<FocusNode> focuses = List.generate(
    4,
    (index) => FocusNode(),
  );

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 4; i++) {
      controllers[i].addListener(() {
        String value = controllers[i].text;
        if (value.isNotEmpty && int.tryParse(value) != null) {
          setState(() {
            values[i] = value;
          });
          if (i < 3) {
            FocusScope.of(context).requestFocus(focuses[i + 1]);
          }
        }
      });
    }
  }

  @override
  void dispose() {
    for (int i = 0; i < 4; i++) {
      controllers[i].dispose();
      focuses[i].dispose();
    }
    super.dispose();
  }

  void showDialog () {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
          decoration: const BoxDecoration(
            color: Color(0xFF1B1C43),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0)
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset('assets/images/appIcons/popup_slider.png', color: const Color(0xFFFFFFFF)),
              ),
              const SizedBox(height: 54),
              RichText(
                text: const TextSpan(
                  text: 'Como conseguir um código\nde acesso da Coinny?\n',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Spartan',
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFFFFFF)
                  ),
                  children: [
                    WidgetSpan(child: SizedBox(height: 54,)),
                    TextSpan(
                      text: 'O código de acesso à Coinny só pode ser gerado por pais e responsáveis pois cada código possui um acesso único para cada aprendiz.\n',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Spartan',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      )
                    ),
                    WidgetSpan(child: SizedBox(height: 40)),
                    TextSpan(
                      text: 'Caso você seja um aprendiz, toque no botão abaixo para ',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Spartan',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      )
                    ),
                    TextSpan(
                      text: 'enviar a solicitação de código para o seu responsável.',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'Spartan',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                      )
                    ),
                  ]
                )
              ),
              const SizedBox(height: 72),
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: CoinnyGradientButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/codeRequest');
                  },
                  title: 'SOLICITAR',
                  fontColor: const Color(0xFF1B1C43),
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        );
      }
    );
  }

  bool inserted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF5D61D6),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.06),
                  child: CoinnyBackButton(
                    color: const Color(0xFFFFFFFF),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ),
                Image.asset('assets/images/appIcons/top.png'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const LoginInfoContainer(
                    title: 'Hey, bem-vindo\nde volta!',
                    description:
                        'Para iniciar a sua sessão, insira o seu\ncódigo de acesso.',
                    white: true,
                  ),
                  const SizedBox(height: 80.0),
                  Row(
                    children: List.generate(
                      4,
                      (index) => Expanded(
                        child: AspectRatio(
                          aspectRatio: 4 / 5,
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.12,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(
                                color: inserted
                                    ? const Color(0xFFFFFFFF)
                                    : const Color(0xFF919ad7),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                style: FontStyles.body1MediumWhite,
                                cursorColor: Colors.white,
                                // Estilo da borda
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                  hintText: '0',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Spartan',
                                    color: Color(0xFFAEB0EA),
                                    fontSize: 16.0,
                                  ),
                                ),
                                controller: controllers[index],
                                focusNode: focuses[index],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 80.0),
                  CoinnyGradientButton(
                      onPressed: () async {
                        String childrenCode = values.join();
                        try {
                          Children userChild = await loadChildren(childrenCode);
                          Navigator.pushReplacementNamed(
                              context, '/childrenMain',
                              arguments: userChild);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text(
                                  'Código Inválido, contate seu responsável e tente novamente')));
                        }
                      },
                      title: "Entrar",
                      fontColor: values[3] != ''
                          ? const Color(0xFF1B1C43)
                          : const Color(0xFFBEC0EF),
                      color: values[3] != ''
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xffffffff).withOpacity(0.2)),
                  const SizedBox(height: 32.0),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'O seu ',
                        style: FontStyles.body3MediumWhite,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'código de acesso',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                showDialog();
                              },
                            style: const TextStyle(
                                decoration: TextDecoration.underline),
                          ),
                          const TextSpan(
                            text:
                                ' pode ser retirado com\nos seus responsáveis.',
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
