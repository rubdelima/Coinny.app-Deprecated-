import 'package:flutter/material.dart';
import 'package:learn/classes/parents.dart';

class ProfileName extends StatelessWidget {
  VolatileParents parent;
  ProfileName({required this.parent, super.key});

  @override
  Widget build(BuildContext context) {
    final widthCenter = MediaQuery.sizeOf(context).width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: widthCenter / 2 - 32,
          child: Text(
            parent.value.name,
                      style: TextStyle(fontFamily: "Sparta", fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xff060C20)),

            textAlign: TextAlign.right,
          ),
        ),
        const Text("|", style: TextStyle(color: Color(0xffB4B4B4)),),
        SizedBox(
          width: widthCenter / 2 - 32,
          child: Text(parent.value.location,
          style: TextStyle(fontFamily: "Sparta", fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xff060C20)),),
        )
      ],
    );
  }
}
