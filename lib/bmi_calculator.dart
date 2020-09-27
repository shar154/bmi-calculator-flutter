import 'dart:math';

class BMICalculator {

  BMICalculator({this.weight, this.height});

  final int weight;
  final int height;
  double _bmi;

  String CalculateBMI() {
    _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getAdvice() {
    if (_bmi >= 25) {
      return 'You need to exercise more regularly';
    }
    else if (_bmi > 18.5) {
      return 'You are perfectly okay.';
    }
    else {
      return 'You need to eat more regularly.';
    }
  }

  String getResults() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    }
    else if (_bmi > 18.5) {
      return 'Normal';
    }
    else {
      return 'Underweight';
    }
  }


}