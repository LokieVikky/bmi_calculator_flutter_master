import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableIconText extends StatelessWidget {
  final String getText;
  final IconData getIcon;

  ReusableIconText({@required this.getText, @required this.getIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          getIcon,
          size: 50.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          getText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
