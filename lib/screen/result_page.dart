import 'package:bmi_calculator_flutter/components/reUsable_container.dart';
import 'package:flutter/material.dart';

import '../components/button_button.dart';

class ResultPage extends StatelessWidget {

  final String bmiResult;
  final String resultText;
  final String interpretation;

  const ResultPage({Key? key, required this.bmiResult, required this.resultText, required this.interpretation}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 20.0),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xff1e2440),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  "YOUR RESULT",
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReUsableContainer(
                onPress: () {},
                colour: Color(0xFF1E2440),
                cardWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(color: Colors.green, fontSize: 22.0),
                    ),
                    Text(
                      bmiResult,
                      style: TextStyle(color: Colors.white, fontSize: 70.0,fontWeight: FontWeight.bold),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                  ],
                ),
              ),
            ),
            ButtonButton(
              buttonTitle: "RE-CALCULATOR",
              onPress: (){
                Navigator.pop(context);
              },),
          ],
        ));
  }
}
