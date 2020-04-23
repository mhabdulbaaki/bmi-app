import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class CardChildProperties extends StatelessWidget {
  final IconData ikon;
  final String message;
  CardChildProperties({@required this.ikon, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          ikon,
          size: iconSize,
          color: iconColor,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          '$message',
          style: kTextStyle,
        ),
      ],
    );
  }
}
