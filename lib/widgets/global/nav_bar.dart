import 'package:flutter/material.dart';

class LearnNavBar extends StatefulWidget {
  final Function(int) onItemTapped;
  final List<Map<String, dynamic>> navItems;

  LearnNavBar({
    required this.onItemTapped,
    required this.navItems,
  });

  @override
  _LearnNavBarState createState() => _LearnNavBarState();
}

class _LearnNavBarState extends State<LearnNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      width: MediaQuery.of(context).size.width * 0.6,
      height: kToolbarHeight + 16,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 0.0,
            blurRadius: 10.0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(widget.navItems.length, (index) {
            String iconName =
                widget.navItems[index]['name'].toString().toLowerCase();
            bool isSelected = _selectedIndex == index;
            return InkWell(
              onTap: () {
                widget.onItemTapped(index);
                _onItemTapped(index);
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    'assets/images/appIcons/icon-$iconName-${isSelected ? 'select' : 'default'}.png',
                    height: 24,
                  ),
                  Text(
                    widget.navItems[index]['name'],
                    style: TextStyle(
                      fontFamily: "Fieldwork-Geo",
                      fontSize: 12,
                      color: isSelected ? Color(0xFF3034AD) : Color(0xFF49454F),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
