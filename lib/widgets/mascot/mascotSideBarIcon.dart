import 'package:flutter/material.dart';

class MascotSideBarIcon extends StatelessWidget {
    final String name;
    final VoidCallback? onPressed;

  MascotSideBarIcon({
    required this.name,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
            alignment: Alignment.bottomLeft,
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Image.asset(
                    'assets/images/mascote/icon-${name.toLowerCase()}-default.png',
                    height: 30,
                  ),
                  Text(name,
                  style: TextStyle(color:  Color(0xFF898989), fontSize: 10, fontFamily: "Fieldwork-Geo", fontWeight: FontWeight.w700,),
                  textAlign: TextAlign.center
                  )
              ],
            ),
            onPressed: onPressed,
          );
    }
}
