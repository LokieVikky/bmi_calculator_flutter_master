import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData getIcon;
  final Function onPressed;
  RoundIconButton({@required this.getIcon, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      fillColor: Colors.grey,
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      child: Icon(
        getIcon,
        color: Colors.white,
      ),
    );
  }
}
