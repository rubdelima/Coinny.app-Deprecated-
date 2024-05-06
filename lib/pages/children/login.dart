import 'package:flutter/material.dart';
import 'package:learn/components.dart';
import "package:learn/widgets.dart";
import "package:learn/utils.dart";

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

  bool enterButtonOn() {
    for (int i = 0; i < 4; i++) {
      if (values[i].isEmpty) {
        return false;
      }
    }
    return true;
  }

  Future<void> childrenLogin() async {
    String childrenCode = values.join();
    try {
      savePersonToken(childrenCode);
      Children userChild = await loadChildren(childrenCode);
      Navigator.pushReplacementNamed(context, '/childrenMain',
          arguments: userChild);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Código Inválido, contate seu responsável e tente novamente')));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(54.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            const LoginAppBar(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Column(
                    children: [
                      CoinnyText(
                        "Código de acesso",
                        fontSize: 22,
                        color: Color(0xFF4349B8),
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      CoinnyText(
                        "O seu código de acesso pode ser retirado com os seus responsáveis",
                        fontSize: 16,
                        color: Color(0xFF5F5F5F),
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0),
                  ChildrenAccessInput(
                    controllers: controllers,
                    focuses: focuses,
                  ),
                  const SizedBox(height: 54.0),
                  CoinnyGradientButton(
                      onPressed: childrenLogin,
                      title: "Entrar",
                      colors: enterButtonOn()
                          ? const [Color(0xFF646AE3), Color(0xFF262B91)]
                          : const [Color(0xff808080), Color(0xff808080)]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
