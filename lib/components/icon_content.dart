import 'package:flutter/material.dart';

import '../constants.dart';


class ReUsableColumn extends StatelessWidget {
  ReUsableColumn(this.icons, this.levels);
  final IconData icons;
  final String levels;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icons,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          levels,
          style: levelTextStyle,
        )
      ],
    );
  }
}
