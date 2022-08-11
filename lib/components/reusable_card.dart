import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color color;
  final Widget childWidget;
  final Function onPress;

  ReusableCard(
      {@required this.color,
      this.childWidget,
      this.onPress}); // constructor , with required fields

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: childWidget,
      ),
    );
  }
}
