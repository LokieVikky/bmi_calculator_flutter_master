import 'package:bmi_calculator/screens/input_page_v2.dart';
import 'package:bmi_calculator/screens/input_page_v3.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/result_page.dart';
import 'package:bmi_calculator/ModelClass/model.dart';
import 'package:bmi_calculator/ModelClass/model.mapper.g.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: InputPageV3(),
      routes: {
        '/resultPage': (context) => Result_Page(),
      },
    );
  }
}
