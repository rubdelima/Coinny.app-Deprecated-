import 'package:flutter/material.dart';
import 'package:learn/components.dart';
import 'package:learn/widgets.dart';
import 'package:learn/classes.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final ValueNotifier<double> pagePosition;
  final PageController pageController;

  ProfilePage({required this.pagePosition, required this.pageController});

  @override
  Widget build(BuildContext context) {
    VolatileParents parent = Provider.of<VolatileParents>(context);
    return Scaffold(
      appBar: LearnAppBar(
        pageIndex: 2,
        pagePosition: pagePosition.value,
        backButtonFunction: () {
          pageController.animateToPage(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        pageTitle: "Meu perfil",
        child: UserPhotoAndName(
          person: parent.value,
          logout: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(children: [
          ProfileTitle(parent: parent),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: parent.value.dependents.values
                .toList()
                .map((child) => Container(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: ChildMonitoringBox(
                      child: child,
                    )))
                .toList(),
          ),
          const SizedBox(
            height: 80,
          )
        ]),
      ),
    );
  }
}