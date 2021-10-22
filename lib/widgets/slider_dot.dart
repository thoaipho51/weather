import 'package:flutter/material.dart';

class SliderDot extends StatelessWidget {

  bool isActive;
  SliderDot(this.isActive);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 6),
      width: isActive ? 12 : 6,
      height: 5,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.all(
            Radius.circular(5),
        ),
      ), duration: const Duration(milliseconds: 150),
    );
  }
}

