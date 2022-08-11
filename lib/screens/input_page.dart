import 'dart:convert';

import 'package:bmi_calculator/ModelClass/model.dart';
import 'package:bmi_calculator/ModelClass/model.mapper.g.dart';
import 'package:bmi_calculator/services/ServiceHelper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 20;
  GenderType selectedGender;
  dynamic getResponse;
  String Error;

  @override
  void initState() {
    //_fdSelected = false;
    super.initState();

    LoginReqModel getLogin = LoginReqModel(
        ExecutiveCode: "NA0000005022",
        UserId: "NA5022-488",
        MPin: "",
        Password: "123456");

    getResponse = httpServicepost<LoginResModel>(
        'http://sginovauat.shriramgi.com/NovaMobility/api/Login/LoginUser',
        getLogin,
        initializeJsonMapper,
        "",
        "");
  }

  // Color maleCardColor = inactiveCardColor;
  // Color femaleCardColor = inactiveCardColor;
  //
  // void updateColor({GenderType gender}) {
  //   if (gender == GenderType.male) {
  //     if (maleCardColor == inactiveCardColor) {
  //       maleCardColor = activeCardColor;
  //       femaleCardColor = inactiveCardColor;
  //     } else {
  //       maleCardColor = inactiveCardColor;
  //     }
  //   } else {
  //     if (femaleCardColor == inactiveCardColor) {
  //       femaleCardColor = activeCardColor;
  //       maleCardColor = inactiveCardColor;
  //     } else {
  //       femaleCardColor = inactiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: FutureBuilder<LoginResModel>(
            future: getResponse,
            builder:
                (BuildContext context, AsyncSnapshot<LoginResModel> snapshot4) {
              if (snapshot4.connectionState == ConnectionState.waiting) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Visibility(
                      visible: snapshot4.hasData,
                      child: Text(
                        "Waiting State CKYNumber",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    )
                  ],
                );
              } else if (snapshot4.connectionState == ConnectionState.done) {
                if (snapshot4.hasError) {
                  return const Text('Error');
                } else if (snapshot4.hasData) {
                  sucesss(snapshot4.data);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "$Error",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: ReusableCard(
                                  color: selectedGender == GenderType.male
                                      ? kActiveCardColor
                                      : kInactiveCardColor,
                                  childWidget: ReusableIconText(
                                    getText: 'Male',
                                    getIcon: FontAwesomeIcons.mars,
                                  ),
                                  onPress: () {
                                    setState(() {
                                      // updateColor(gender: GenderType.male);
                                      selectedGender = GenderType.male;
                                    });
                                  }),
                            ),
                            Expanded(
                              child: ReusableCard(
                                color: selectedGender == GenderType.female
                                    ? kActiveCardColor
                                    : kInactiveCardColor,
                                childWidget: ReusableIconText(
                                  getText: 'Female',
                                  getIcon: FontAwesomeIcons.venus,
                                ),
                                onPress: () {
                                  setState(() {
                                    selectedGender = GenderType.female;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ReusableCard(
                          color: kInactiveCardColor,
                          childWidget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Height',
                                style: kLabelTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.ideographic,
                                children: [
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
                              SliderTheme(
                                data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: Colors.white,
                                    thumbColor: Colors.redAccent,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: 15.0),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: 30.0)),
                                child: Slider(
                                    value: height.toDouble(),
                                    min: 120.0,
                                    max: 220,
                                    inactiveColor: Colors.grey,
                                    onChanged: (double newValue) {
                                      setState(() {
                                        height = newValue.round();
                                      });
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                            child: ReusableCard(
                              color: kInactiveCardColor,
                              childWidget: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('WEIGHT'),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    weight.toString(),
                                    style: kNumberTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundIconButton(
                                        getIcon: FontAwesomeIcons.minus,
                                        onPressed: () {
                                          setState(() {
                                            weight--;
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      RoundIconButton(
                                        getIcon: FontAwesomeIcons.plus,
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
                            ),
                          ),
                          Expanded(
                            child: ReusableCard(
                              color: kInactiveCardColor,
                              childWidget: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('AGE'),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    age.toString(),
                                    style: kNumberTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RoundIconButton(
                                          getIcon: FontAwesomeIcons.minus,
                                          onPressed: () {
                                            setState(() {
                                              age--;
                                            });
                                          }),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      RoundIconButton(
                                          getIcon: FontAwesomeIcons.plus,
                                          onPressed: () {
                                            setState(() {
                                              age++;
                                            });
                                          })
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                      BottomButton(
                        bottonTitle: 'Calculate',
                        onTap: () async {
                          CalculatorBrain getResult =
                              CalculatorBrain(height: height, weight: weight);

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) {
                          //     return Result_Page(
                          //       bmi: getResult.calculateBmi(),
                          //       bmiText: getResult.getResult(),
                          //       bmiTextMessage: getResult.interpretation(),
                          //     );
                          //   }),
                          // );
                        },
                      ),
                    ],
                  );
                } else {
                  return const Text('');
                }
              } else {
                return const Text('');
              }
            }));
  }

  void sucesss(value) {
    Error = value.MessageResult.ErrorMessage;
    int i;
  }
}
