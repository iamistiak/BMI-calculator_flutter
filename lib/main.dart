import 'package:bmi_calculator_flutter/screen/result_page.dart';
import 'package:flutter/material.dart';

import 'screen/input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF161C3B),
        scaffoldBackgroundColor: const Color(0xFF161C3B),
      ),
      initialRoute: '/',
      routes: {
        "/" : (context) => const InputPage(),
       // '/resultPage' : (context) => const ResultPage(),

      },
    );
  }
}


