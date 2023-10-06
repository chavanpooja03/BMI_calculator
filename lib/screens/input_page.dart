import 'package:bmi_calculator/componants/BottomButton.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:bmi_calculator/screens/constant.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/componants/reusabe_card.dart';
import '../componants/icon_content.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../componants/RoundIconButton.dart';

int height = 180;
int weight = 60;
int age = 20;

enum Gender { male, female }

Color activeCardColour = Color(0xFF8D8E98);
Color inactiveCardColour = Color(0xFF111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: reusable_card(
                      colour: selectedGender == Gender.male
                          ? activeCardColour
                          : inactiveCardColour,
                      cardChild: Icon_content(
                          icon: FontAwesomeIcons.mars, label: 'MALE')),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: reusable_card(
                    colour: selectedGender == Gender.female
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: Icon_content(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: reusable_card(
              colour: kActiveCardColour,
              cardChild: Column(
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xFFEB1555),
                    inactiveColor: Color(0xFF8D8E98),
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
            child: Row(children: <Widget>[
              Expanded(
                  child: reusable_card(
                colour: kActiveCardColour,
                cardChild: Column(
                  children: <Widget>[
                    Text('Weight', style: kLabelTextStyle),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            }),
                        SizedBox(width: 10),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: reusable_card(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        children: <Widget>[
                          Text('Age', style: kLabelTextStyle),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(width: 15.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () {
              calculator_brain calc =
                  calculator_brain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                          bmiResult: calc.CalculateBMI(),
                          resultText: calc.getResult(),
                          getInterpretation: calc.getInterpretation())));
            },
            child: Container(
              child: Center(
                child: Text('Calculate'),
              ),
              color: kBottomColour,
              width: double.infinity,
              height: 50.0,
              margin: EdgeInsets.only(top: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
