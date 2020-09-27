import 'package:flutter/material.dart';


class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.tapButton});

  final Function tapButton;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,color: Colors.pink,),
      elevation: 0.0,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      onPressed:tapButton ,
    );
  }
}
