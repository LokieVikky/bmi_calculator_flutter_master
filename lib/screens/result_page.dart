import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import '../components/bottom_button.dart';

class Result_Page extends StatelessWidget {
  String bmi;
  String bmiText;
  String bmiTextMessage;

  Result_Page(
      {@required this.bmi,
      @required this.bmiText,
      @required this.bmiTextMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15),
              child: Text(
                'Your Result',
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: kInactiveCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bmiText,
                    style: kResultLabelTitleStyle,
                  ),
                  Text(
                    bmi,
                    style: kResultLabelBodyStyle,
                  ),
                  Text(
                    bmiTextMessage,
                    textAlign: TextAlign.center,
                    style: kResultLabelMessageStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            bottonTitle: 'Re-Calculate',
            onTap: () {
              Navigator.pop(context);
              // Navigator.pushNamed(context, '/resultPage');
            },
          )
        ],
      ),
    );
  }
}
