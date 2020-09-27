import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BMIContainer extends StatelessWidget {

  BMIContainer({@required this.colour, @required this.cardChild, this.tapFunction});
  final Color colour;
  final Widget cardChild;
  final Function tapFunction;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.tapFunction,
      child: Container(
        child: this.cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),

      ),
    );
  }
}

