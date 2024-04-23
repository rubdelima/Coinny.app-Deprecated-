import 'package:flutter/material.dart';

class MascotBar extends StatelessWidget implements PreferredSizeWidget {
  final PageController pageController;

  MascotBar({required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AppBar(
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors:  [Color(0XFFFFFFFF), Color(0XFFFFFFFF),],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Color(0xff101573)),
                iconSize: 22,
                onPressed: () {
                  pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              ),
            ),
          ],
        ),
        title: const Text('Mascote',
            style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 18,
                fontFamily: 'Fieldwork-Geo',
                fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: const Color(0xFFBBD1E4),
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Provide the preferred size here
}