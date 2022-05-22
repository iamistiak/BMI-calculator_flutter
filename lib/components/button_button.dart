import 'package:flutter/material.dart';

import '../constants.dart';

class ButtonButton extends StatelessWidget {

  ButtonButton({required this.buttonTitle, required this.onPress});

  final String buttonTitle;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        height: buttonContainerHeight,
        color: Colors.pink,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10.0),
        child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 3.0,
          ),
        ),
      ),
    );
  }
}
