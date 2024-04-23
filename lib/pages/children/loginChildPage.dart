import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:learn/widgets/login/loginAppBar.dart';
import 'package:learn/widgets/login/loginEnterButton.dart';

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
                      Text(
                        "Código de acesso",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF4349B8),
                          fontFamily: "Fieldwork-Geo",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                          "O seu código de acesso pode ser retirado com os seus responsáveis",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF5F5F5F),
                            fontFamily: "Fieldwork-Geo",
                            fontWeight: FontWeight.w500,
                          )),
                    ],
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    children: List.generate(
                      4,
                      (index) => Expanded(
                        child: AspectRatio(
                          aspectRatio: 4 / 5,
                          child: Container(
                            margin: const EdgeInsets.all(4.0),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                cursorColor: Colors.black,
                                // Estilo da borda
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  counterText: '',
                                  hintText: '0',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 24.0,
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
                  const SizedBox(height: 54.0),
                  LoginEnterButton(
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
                      colors: values[3] != ''
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
