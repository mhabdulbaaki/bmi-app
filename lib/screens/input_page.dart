import 'package:bmi_calculator/bmi_brain.dart';
import 'package:bmi_calculator/card_child_properties.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';

enum CardType { maleCard, femaleCard }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  CardType selectedGender;
  int height = 180;
  int weight = 60;
  int age = 30;

//  Color maleCardColor = inActiveCardcolor;
//  Color femaleCardColor = inActiveCardcolor;
//
//  //1 male //2 female
//  void updateColor(CardType cardIdentifier) {
//    if (cardIdentifier == CardType.maleCard) {
//      if (maleCardColor == inActiveCardcolor) {
//        maleCardColor = activeCardColor;
//        femaleCardColor = inActiveCardcolor;
//      } else {
//        maleCardColor = inActiveCardcolor;
//      }
//    } else if (cardIdentifier == CardType.femaleCard) {
//      if (femaleCardColor == inActiveCardcolor) {
//        femaleCardColor = activeCardColor;
//        maleCardColor = inActiveCardcolor;
//      } else {
//        femaleCardColor = inActiveCardcolor;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = CardType.maleCard;
                      });
                    },
                    kolor: selectedGender == CardType.maleCard
                        ? kActiveCardColor
                        : kInActiveCardcolor,
                    cardChild: CardChildProperties(
                      ikon: FontAwesomeIcons.mars,
                      message: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = CardType.femaleCard;
                      });
                    },
                    kolor: selectedGender == CardType.femaleCard
                        ? kActiveCardColor
                        : kInActiveCardcolor,
                    cardChild: CardChildProperties(
                      ikon: FontAwesomeIcons.venus,
                      message: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              kolor: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kBoldTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 240.0,
                    activeColor: kBottomContainerColor,
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    kolor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kBoldTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    kolor: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kBoldTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            message: 'CALCULATE',
            onTap: () {
              BMIBrain calc = BMIBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                            bmi: calc.getBMI(),
                            bmiInterpretation: calc.getInterpretation(),
                            bmiResult: calc.getResult(),
                          )));
            },
          ),
        ],
      ),
    );
  }
}

//customizing the slider theme

//SliderTheme(
//data: SliderTheme.of(context).copyWith(
//thumbColor: kBottomContainerColor,
//activeTrackColor: Colors.white,
//overlayColor: kBottomContainerColor,
//thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
//overlayShape: RoundSliderOverlayShape(overlayRadius: 32),
//),
