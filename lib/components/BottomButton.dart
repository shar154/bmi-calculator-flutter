import 'package:flutter/material.dart';
import '../constants.dart';


class BottomButton extends StatelessWidget {
  BottomButton({@required this.title, @required this.onTap});
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
          color: kbottomContainerColour,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: kbottomContainerHeight,
          alignment: Alignment.center,
          child: Text(
            title,
            style: ktitleStyle,
          )
      ),
    );
  }
}
