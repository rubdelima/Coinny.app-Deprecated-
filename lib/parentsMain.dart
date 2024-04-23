import 'package:flutter/material.dart';
import 'package:learn/pages/parents/homePage.dart';
import 'widgets/global/navBar.dart';
import 'pages/parents/profilePage.dart';
import 'pages/parents/monitoringPage.dart';
import 'package:learn/utils/modelsClass.dart';
import 'package:provider/provider.dart';

class ParentsMain extends StatefulWidget {
  @override
  _ParentsMainState createState() => _ParentsMainState();
}

class _ParentsMainState extends State<ParentsMain> {
  int _selectedIndex = 0;
  PageController _pageController = PageController();
  ValueNotifier<double> pagePosition = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
    _pageController.addListener(() {
      if (pagePosition.value != _pageController.page) {
        setState(() {
          pagePosition.value = _pageController.page!;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    final parent = ModalRoute.of(context)?.settings.arguments as Parents;

    List<Widget> _pageOptions = [
      ParentsHPage(pagePosition: pagePosition,),
      MonitoringPage(pagePosition: pagePosition),
      ProfilePage(pagePosition: pagePosition,pageController: _pageController,)
    ];

    List<Map<String, dynamic>> navItems = [
      {'icon': Icons.home, 'name': 'Home'},
      {'icon': Icons.monitor, 'name': 'Monitorar'},
      {'icon': Icons.person, 'name': 'Perfil'},
    ];

    return ChangeNotifierProvider<VolatileParents>(
    create: (context) => VolatileParents(parents: parent),
    child: Scaffold(
        body: Stack(
      children: [
        PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: _pageOptions,
        ),
        Positioned(
            left: 32,
            right: 32,
            bottom: 32,
            child: LearnNavBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
              navItems: navItems,
            ))
      ],
    )
    )
    );
  }
}
