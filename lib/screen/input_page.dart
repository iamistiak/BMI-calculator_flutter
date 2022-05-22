import 'package:bmi_calculator_flutter/components/calculator_brain.dart';
import 'package:bmi_calculator_flutter/components/reUsable_container.dart';
import 'package:bmi_calculator_flutter/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/button_button.dart';
import '../constants.dart';
import '../components/icon_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender; //null value ignore er jonno ? deya
  int height = 180;
  int weight = 60;
  int age = 19;

  // Color maleCardColor = inActiveCardColor;
  // Color femaleCardColor = inActiveCardColor;
  // void UpdateColor(Gender selectedGender){
  //   if(selectedGender == Gender.male){
  //     if(maleCardColor==inActiveCardColor){
  //       maleCardColor=activeCardColor;
  //       femaleCardColor=inActiveCardColor;
  //     }else{
  //       maleCardColor=inActiveCardColor;
  //     }
  //   }
  //   if(selectedGender == Gender.female){
  //     if(femaleCardColor==inActiveCardColor){
  //       femaleCardColor=activeCardColor;
  //       maleCardColor=inActiveCardColor;
  //     }else{
  //       femaleCardColor=inActiveCardColor;
  //     }
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 20.0),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff1e2440),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              //male
              Expanded(
                child: ReUsableContainer(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? activeCardColor
                      : inActiveCardColor,
                  cardWidget: ReUsableColumn(FontAwesomeIcons.mars, "Male"),
                ),
              ),
              //female
              Expanded(
                child: ReUsableContainer(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? activeCardColor
                      : inActiveCardColor,
                  cardWidget:
                      ReUsableColumn(FontAwesomeIcons.accessibleIcon, "FeMale"),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReUsableContainer(
              onPress: () {},
              colour: inActiveCardColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: levelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: numberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: levelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Colors.pink,
                      overlayColor: Color(0xFFA14160),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReUsableContainer(
                    onPress: () {},
                    colour: inActiveCardColor,
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: levelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.minimize,
                              onpress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onpress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReUsableContainer(
                    onPress: () {},
                    colour: inActiveCardColor,
                    cardWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: levelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.minimize,
                              onpress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: Icons.add,
                              onpress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonButton(
            buttonTitle: "CALCULATOR",
            onPress: (){
              CalculatorBrain calc=  CalculatorBrain(height, weight,18.0);
           /*   calc.getResult();
              calc.getInterpretation();*/

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(
              bmiResult: calc.calculateBMI(),
              resultText: calc.getResult(),
              interpretation: calc.getInterpretation(),
            )));
          },),
        ],
      ),
    ));
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({this.icon, required this.onpress});

  final IconData? icon;
  final Function() onpress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpress,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      fillColor: Color(0xFF4C4F5E),
      shape: CircleBorder(),
      elevation: 6.0,
      child: Icon(icon),
    );
  }
}
