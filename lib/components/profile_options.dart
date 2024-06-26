import 'package:flutter/material.dart';

class ProfileOption extends StatelessWidget {
  String iconPath;
  String title;
  int lenNotifications;
  void Function()? onTap;

  Widget finalArrow() {
    if (lenNotifications == 0) {
      return  Image.asset(
        "assets/images/appIcons/right_arrow.png",
        color:  Color(0xff060C20));
    }
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Color(0xffFF657D), borderRadius: BorderRadius.circular(20)),
      child: 
      
      SizedBox(
        height: 8, width: 8,
        child: Center(child: Text(
        lenNotifications.toString(),
        style: const TextStyle(
            fontFamily: "Sparta",
            fontSize: 8,
            fontWeight: FontWeight.w400,
            color: Color(0xffffffff)),
      ))),
    );
  }

  ProfileOption(
      {required this.iconPath,
      required this.title,
      this.lenNotifications = 0,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/appIcons/$iconPath.png",
                      height: 16,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontFamily: "Sparta",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff060C20)),
                    ),
                  ],
                ),
                if (lenNotifications >= 0) finalArrow()
              ],
            )));
  }
}
