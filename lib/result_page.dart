
import 'componants/reusabe_card.dart';
import 'package:flutter/material.dart';
import 'screens/constant.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.getInterpretation});
  final String bmiResult;
  final String resultText;
  final String getInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
              child: reusable_card(
            colour: kActiveCardColour,
            cardChild: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  resultText,
                  textAlign: TextAlign.center,
                  style: kResultTextStyle,
                ),
                Text(
                  bmiResult,
                  style: kBMItextStyle,
                ),
                Text(
                  getInterpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                ),
              ],
            ),
          )),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text('Re-calculate'),
                ),
                color: kBottomColour,
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.only(top: 20),
              )),
        ],
      ),
    );
  }
}
