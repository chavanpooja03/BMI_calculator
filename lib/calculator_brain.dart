import 'dart:math';

class calculator_brain {
  calculator_brain({required this.height, required this.weight});
  final int height;
  final int weight;
  double _bmi = 0.0;
  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return "You have a higher than a normal body weight,try to exercise more";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight ,Good Job!";
    } else {
      return "You have less than normal body weigth,you should eat more";
    }
  }
}
