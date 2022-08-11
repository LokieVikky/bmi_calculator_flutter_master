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

class InputPageV3 extends StatefulWidget {
  @override
  _InputPageV3State createState() => _InputPageV3State();
}

class _InputPageV3State extends State<InputPageV3> {
  int height = 180;
  int weight = 60;
  int age = 20;
  GenderType selectedGender;
  dynamic getResponse;
  String Error;

  bool isLoading = false;

  LoginReqModel getLogin = LoginReqModel(
      ExecutiveCode: "NA0000005022",
      UserId: "NA5022-488",
      MPin: "",
      Password: "123456");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "$Error",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30.0)),
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
              ),
            ),
            FutureBuilder<LoginResModel>(
              future: httpServicepost<LoginResModel>(
                'http://sginovauat.shriramgi.com/NovaMobility/api/Login/LoginUser',
                getLogin,
                initializeJsonMapper,
                "",
                "",
              ),
              builder: (BuildContext context,
                  AsyncSnapshot<LoginResModel> snapshot) {
                print(snapshot.data);
                print(snapshot.connectionState);
                if (snapshot.connectionState == ConnectionState.done) {
                  return BottomButton(
                    bottonTitle: 'Calculate',
                    onTap: () {},
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
