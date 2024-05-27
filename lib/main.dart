import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn/backend/firebase_options.dart';
//import 'pages/loginPage.dart';
import 'package:learn/pages/login_v1.dart';
import 'pages/parents/signUp.dart';
import 'source/parents.dart';
import 'source/children.dart';
import 'docs/activities/lession01Main.dart';
import 'package:learn/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Coinny',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Authenticator(),
      routes: {
        // rotas da aplicação
        '/signUp': (context) => SignParentsPage(),
        '/login': (context) => LoginPage(),
        '/parentsMain': (context) => ParentsMain(),
        '/childrenMain': (context) => ChildrenMain(),
        '/signUpParents': (context) => SignParentsPage(),
        '/lession01': (context) => Lession01Main()
      },
    );
  }
}

class Authenticator extends StatelessWidget {
  const Authenticator({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Person?>(
        future:loadLocalPerson(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Future.microtask(() => Navigator.pushReplacementNamed(
                  context, snapshot.data is Parents ? '/parentsMain' : '/childrenMain',
                  arguments: snapshot.data));
              return const Scaffold(body: Center(child: CircularProgressIndicator()));
            }
            if (snapshot.hasError || snapshot.data == null) {
              return LoginPage();
            }
          }
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      );
  }
}
