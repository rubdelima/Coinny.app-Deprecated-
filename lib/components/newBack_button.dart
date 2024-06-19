import 'package:flutter/material.dart';

class CoinnyBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool defaultIcon;

  CoinnyBackButton({
    this.onPressed,
    this.defaultIcon = true,
    super.key
    });

  static const IconData arrow_back = IconData(0xee84, fontFamily: 'MaterialIcons', matchTextDirection: true);

  final String iconPath = 'assets/images/appIcons/backArrow.png';

  // ...

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: defaultIcon? const Icon(arrow_back) : Image.asset(iconPath) ,
      iconSize: 24,
      onPressed: onPressed,
    );
  }
}