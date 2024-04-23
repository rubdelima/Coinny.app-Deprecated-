import 'package:flutter/material.dart';
import 'package:learn/utils/modelsClass.dart';

class LessionCardStatic extends StatelessWidget {
  final Lession lession;
  final bool isLocked;
  final bool isFinished;
  final VoidCallback callback;

  LessionCardStatic(
      {required this.lession,
      this.isLocked = true,
      this.isFinished = false,
      required this.callback,
      super.key});

  @override
  Widget build(BuildContext context) {
    final color = isLocked
        ? const Color(0xFF3C3C3C).withOpacity(0.5)
        : isFinished
            ? const Color(0xFF179A53)
            : const Color(0xFF4349B8);

    final width = MediaQuery.sizeOf(context).width;
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(16),
        width: width - 32,
        decoration: BoxDecoration(
            color: color.withOpacity(isFinished ? 0.05 : 0.0),
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(10)
            ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: width * 0.75,
                child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${lession.title}\n\n",
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: lession.description,
                          style: const TextStyle(
                              fontSize: 11, fontWeight: FontWeight.w400),
                        ),
                      ],
                      style: TextStyle(
                        fontFamily: "Fieldwork-Geo",
                        color: color,
                      )),
                )),
            Icon(
              isLocked
                  ? Icons.lock
                  : isFinished
                      ? Icons.check
                      : Icons.chevron_right,
              color: color,
              weight: 10,
            )
          ],
        ),
      ),
      onTap: () {
        if (!isLocked && !isFinished) {
        callback();
        }
      },
    );
  }
}