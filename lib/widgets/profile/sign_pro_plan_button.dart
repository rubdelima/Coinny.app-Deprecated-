import 'package:flutter/material.dart';

class SignProPlanButton extends StatelessWidget {
  const SignProPlanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const LinearGradient(
                  begin: AlignmentDirectional.topStart,
                  end: AlignmentDirectional.bottomEnd,
                  colors: [
                    Color(0XFFFFF6D2),
                    Color(0XFFFFEA95),
                    Color(0XFFFFD37F)
                  ])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "ASSINE O PLANO PRO",
                style: TextStyle(
                  color: Color(0xff060C20),
                  fontFamily: "Spartan",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Image.asset(
                "assets/images/appIcons/icon-steak.png",
                height: 17,
                color: const Color(0xff060C20),
              ),
            ],
          )),
    );
  }
}
