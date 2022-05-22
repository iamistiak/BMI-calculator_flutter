import 'package:flutter/material.dart';

class ReUsableContainer extends StatelessWidget {
  ReUsableContainer({required this.colour, required this.cardWidget, required this.onPress});

  final Color colour;
  final Widget cardWidget;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardWidget,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
