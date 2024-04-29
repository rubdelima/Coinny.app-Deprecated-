import 'package:flutter/material.dart';
import 'package:learn/classes/children.dart';
import 'package:learn/components.dart';
import 'package:learn/utils.dart';


class ChildOverview extends StatelessWidget {
  Children children;
  ChildOverview(this.children ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF040862).withOpacity(0.6),
                      spreadRadius: 0,
                      blurRadius: 16,
                      offset: const Offset(0, 0),
                    )
                  ]),
              child: UserPhotoAndName(
                person: children,
                isSugestion: true,
              ));
  }
}