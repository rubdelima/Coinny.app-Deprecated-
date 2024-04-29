import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn/backend/firebase_options.dart';
import 'pages/loginPage.dart';
import 'pages/parents/signUp.dart';
import 'source/parents.dart';
import 'source/children.dart';
import 'docs/activities/lession01Main.dart';
import 'package:learn/classes/parents.dart';
import 'package:learn/classes/person.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn/classes/children.dart';

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

class AuthenticationChecker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null && currentUser.email != null) {
      // acessa a database para verificar os dados do usuário
      return FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('parent')
            .doc(currentUser.email)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.data() != null) {
            var userData = snapshot.data!.data() as Map<String, dynamic>;
            String name = userData['name'] ?? 'Sem nome';
            String photoPath = userData['photoPath'] ?? 'Sem foto';
            List<dynamic> dependents = userData['dependents'] ?? ["1111"];
            print('Name: $name');
            print('Photo Path: $photoPath');
            print('Dependents: $dependents');
            /*Navigator.pushReplacementNamed(
              context,
              '/parentsMain',
              arguments: Parents(
                name: name,
                photoPath: photoPath,
                email: currentUser.email!,
                // COMPLETAR A LÓGICA AQUI
                //dependents: [1111, 2222, 9892, 1022],
              ),*/

            return LoginPage();
          } else {
            return SignParentsPage();
          }
        },
      );
    } else {
      return LoginPage();
    }
  }
}
