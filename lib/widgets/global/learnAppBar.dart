import 'package:flutter/material.dart';

class LearnAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;
  final double pagePosition;
  final int pageIndex;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? backButtonFunction;
  final double heigth;
  final Gradient? gradient;

  LearnAppBar({
    this.child,
    this.pageIndex = 0,
    this.pagePosition = 0,
    this.alignment,
    this.padding,
    this.backButtonFunction,
    this.heigth = 240,
    this.gradient,
  });

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
          colors: const [
            Color(0xFF7A7FFF),
            Color(0xFF040862),
          ],
        );

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: preferredSize.height,
      decoration: BoxDecoration(
        gradient: finalGradient,
        borderRadius: isRounded
            ? const BorderRadius.vertical(bottom: Radius.circular(50))
            : BorderRadius.zero,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            if (backButtonFunction != null)
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: backButtonFunction,
                        iconSize: 24,
                      ))),
            Container(alignment: alignment, padding: padding, child: child)
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(heigth);
}

class LearnAppBarSuper extends LearnAppBar {
  final Widget superWidget;
  final VoidCallback? backButtonFunction;
  final double superHeigth;
  final double globalHeigth;

  LearnAppBarSuper(
      {required this.superWidget,
      Widget? child,
      double pagePosition = 0,
      int pageIndex = 0,
      this.backButtonFunction,
      this.globalHeigth = 280,
      this.superHeigth = 240})
      : super(
            child: child,
            pagePosition: pagePosition,
            pageIndex: pageIndex,
            backButtonFunction: backButtonFunction,
            heigth: superHeigth);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: globalHeigth + 32 ,
        child: Container(
          child: Stack(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height : superHeigth - 40,
                child: super.build(context)
                ),
            Positioned(
              child: superWidget,
              top: 150 + (superHeigth - 280),
              left: 16,
              right: 16,
            ),
          ],
        )));
  }

  @override
  Size get preferredSize => Size.fromHeight(globalHeigth + 40);
}
