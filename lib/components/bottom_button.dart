import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  // const BottomButton({
  //   Key key,
  // }) : super(key: key);

  final String bottonTitle;
  final Function onTap;

  BottomButton({@required this.bottonTitle, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          bottonTitle,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kActiveBottomCardColor,
        margin: EdgeInsets.only(top: 10),
      ),
    );
  }
}
