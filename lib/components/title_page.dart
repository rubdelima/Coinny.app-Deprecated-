import 'package:flutter/material.dart';
import 'package:learn/utils/fonts.dart';

class CoinnyTitleSubTitlePage extends StatelessWidget {
  final String title;
  final String subTitle;

  const CoinnyTitleSubTitlePage(
      {required this.title, required this.subTitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 80, 16, 0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CoinnyText(title, fontWeight: FontWeight.w700, fontSize: 18),
            const SizedBox(
              height: 4,
            ),
            CoinnyText(subTitle, fontWeight: FontWeight.w300, fontSize: 12),
          ]),
    );
  }
}
