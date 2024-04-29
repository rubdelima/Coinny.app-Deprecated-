import 'package:flutter/material.dart';
import 'package:learn/utils.dart';

class LearnAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;
  final double pagePosition;
  final int pageIndex;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? backButtonFunction;
  final Gradient? gradient;
  final Widget? superWidget;
  final String? pageTitle;

  LearnAppBar(
      {this.child,
      this.pageIndex = 0,
      this.pagePosition = 0,
      this.alignment,
      this.padding,
      this.backButtonFunction,
      this.gradient,
      this.superWidget,
      this.pageTitle});

  @override
  Widget build(BuildContext context) {
    bool isRounded = pagePosition == pagePosition.floorToDouble();
    double pageOffset = pagePosition - pageIndex;
    Alignment gradientStart = Alignment(-pageOffset, -1.0);
    Alignment gradientEnd = Alignment(pageOffset, 1.0);

    final Gradient finalGradient = gradient ??
        LinearGradient(
            begin: gradientStart,
            end: gradientEnd,
            colors: ComponentsColors().activities.colors);

    return SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: preferredSize.height,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 240,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                gradient: finalGradient,
                borderRadius: isRounded
                    ? const BorderRadius.vertical(bottom: Radius.circular(50))
                    : BorderRadius.zero,
              ),
              child: SafeArea(
                child: Container(
                    alignment: alignment, padding: padding, child: child),
              ),
            ),
            if (backButtonFunction != null || pageTitle != null)
              Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Stack(children: [
                    if(pageTitle != null)
                      Center(
                        child: CoinnyText(
                          pageTitle as String,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: backButtonFunction,
                          iconSize: 24,
                        ))
                  ])),
            if (superWidget != null)
              Positioned(top: 200, left: 16, right: 16, child: superWidget!)
          ],
        ));
  }

  @override
  Size get preferredSize =>
      Size.fromHeight((superWidget == null || child == null) ? 240 : 324);
}
