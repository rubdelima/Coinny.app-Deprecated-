import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn/backend/firebase_options.dart';
import 'package:learn/pages/signUp.dart';
import 'package:overlay_support/overlay_support.dart';
import 'pages/loginPage.dart';
import 'pages/parents/signUpParents.dart';
import 'source/parents.dart';
import 'source/children.dart';
import 'docs/activities/lession01Main.dart';
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
    return OverlaySupport(
      child: MaterialApp(
        title: 'Coinny',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const Authenticator(),
        routes: {
          // rotas da aplicação
          '/signUp': (context) => const SignUp(),
          '/login': (context) => LoginPage(),
          '/parentsMain': (context) => ParentsMain(),
          '/childrenMain': (context) => ChildrenMain(),
          '/signUpParents': (context) => SignParentsPage(),
          '/lession01': (context) => Lession01Main()
        },
      ),
    );
  }
}

class Authenticator extends StatelessWidget {
  const Authenticator({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      return FutureBuilder<Parents>(
        future: loadParent(currentUser.email!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              Future.microtask(() => Navigator.pushReplacementNamed(
                  context, '/parentsMain',
                  arguments: snapshot.data));
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
          }
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        },
      );
    }
    // Retorna a LoginPage se não houver usuário atual
    return LoginPage();
  }
}

