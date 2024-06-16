import 'package:flutter/material.dart';

class CoinnyBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  CoinnyBackButton({
    this.onPressed,
    super.key
    });

  static const IconData arrow_back = IconData(0xee84, fontFamily: 'MaterialIcons', matchTextDirection: true);
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: const Icon(arrow_back),
        iconSize: 24,
        onPressed: onPressed
      );
  }
}