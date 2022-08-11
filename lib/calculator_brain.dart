import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;
  double _bmi;

  CalculatorBrain({@required this.height, @required this.weight});

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Over Weight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String interpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight, try to exercise more!';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight, good job!';
    } else {
      return 'You have a lower body weight, eat a bit more!';
    }
  }
}
