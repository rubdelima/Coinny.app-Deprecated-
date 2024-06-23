import 'package:flutter/material.dart';
import 'package:learn/components/profile_name.dart';
import 'package:learn/widgets.dart';
import 'package:learn/classes.dart';
import 'package:learn/components.dart';
import 'package:learn/pages/parents/edit_dependent.dart';
import 'package:provider/provider.dart';

class NewProfilePage extends StatelessWidget {
  NewProfilePage();

  @override
  Widget build(BuildContext context) {
    VolatileParents parent = Provider.of<VolatileParents>(context);

    return Scaffold(
        backgroundColor: const Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 80, 16, 0),
          child: Column(
            children: [
              PulsingCircleAvatar(
                  circleColor: const Color(0xff060C20),
                  imagePath: parent.value.photoPath),
              ProfileName(
                parent: parent,
              ),
              if (!parent.value.isPremium)
                const SizedBox(
                  height: 24,
                ),
              const SignProPlanButton(),
              const SizedBox(
                height: 24,
              ),
              ProfileOption(iconPath: "heart", title: "Dependentes"),
              ProfileOption(iconPath: "settings", title: "Configurações"),
              ProfileOption(
                  iconPath: "bell", title: "Notificações", lenNotifications: 3),
              ProfileOption(
                  iconPath: "log-out", title: "Sair", lenNotifications: -1
                  /*
              onTap: (){
                clearLocalPerson();
                 Navigator.pushReplacementNamed(context, '/login');
              }
              */
                  )
            ],
          ),
        ));
  }
}
