import 'package:flutter/material.dart';
import 'package:learn/utils.dart';

class ProfileSelector extends StatelessWidget {
  final String profileType;
  final bool isSelected;
  final VoidCallback onTap;

  const ProfileSelector({
    required this.profileType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final widgetWidth = MediaQuery.sizeOf(context).width / 2 - 26;
    final widgetHeigth = widgetWidth * 1.12;
    const primaryColor = Color(0xFF5B61D7);

    const secondaryColor=  Color(0xFFB6B6B6);
    return InkWell(
        onTap: onTap,
        child: Container(
          width: widgetWidth,
          height: widgetHeigth,
          child: Stack(
            alignment: Alignment.center,
            children: [
            Positioned(
                bottom: 0,
                child: Container(
                  width: widgetWidth,
                  height: widgetHeigth - 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    color: !isSelected
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).primaryColor,
                  ),
                  alignment: Alignment.bottomCenter,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  child: CoinnyText(
                    profileType == "responsavel"
                        ? "Sou um responsável"
                        : "Sou um(a) filho(a)",
                    color: isSelected
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                )),
            Positioned(
                top: 0,
                child: Container(
                  width: widgetWidth * 0.64,
                  height: widgetHeigth * 0.64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                    color: isSelected
                        ? Theme.of(context).canvasColor
                        : Theme.of(context).primaryColor,
                  ),
                ))
          ]),
        ));
  }
}
