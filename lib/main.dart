import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn/backend/firebase_options.dart';
import 'package:learn/docs/activities/lession01Main.dart';
import 'pages/loginPage.dart';
import 'source/parents.dart';
import 'source/children.dart';
import 'pages/parents/signUp.dart';
import 'package:learn/classes.dart';

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
      home: AuthenticationChecker(),
      routes: {
        '/login': (context) => LoginPage(),
        '/parentsMain': (context) => ParentsMain(),
        '/childrenMain': (context) => ChildrenMain(),
        '/signUpParents': (context) => SignParentsPage(),
        '/lession01': (context) => Lession01Main()
      },
    );
  }
}

class AuthenticationChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Debug, aqui vemos que o estado está sendo salvo
      print('User Name: ${currentUser.displayName}');
      print('User Email: ${currentUser.email}');

      // não estou passando a page inicial, mas sim a página de login, debug
      return LoginPage();
      // basta tentar resolver o constutor de ParentsMain
      //return ParentsMain();
    } else {
      return LoginPage();
    }
  }
}
