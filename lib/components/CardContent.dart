import 'package:flutter/material.dart';
import '../constants.dart';

class CardContent extends StatelessWidget {
  CardContent({this.cardText, this.cardIcon} );

  final String cardText;

  final IconData cardIcon;


  static const box = SizedBox(
      height: 15.0
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(cardIcon,
          size: 80,
        ),
        box,
        Text(cardText, style: ktextStyle)
      ],
    );
  }
}
