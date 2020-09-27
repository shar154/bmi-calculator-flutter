import 'package:flutter/material.dart';
import '../components/BMIContainer.dart';
import '../constants.dart';
import '../components/BottomButton.dart';



class ResultPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final ResultScreenArgs args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              child:Text('Your Results',
                style:ktitleStyle,
              ),
            ),
          ),
          Expanded(
            flex:10,
            child: BMIContainer(
              colour: kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(args.bmiStatus,
                    style: kresultStyle,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(args.bmiResult,
                    style: TextStyle(
                      fontSize: 100,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      args.bmiAdvice,
                      style: kbodyStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              title: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}

class ResultScreenArgs {


  final String bmiStatus;
  final String bmiAdvice;
  final String bmiResult;

  ResultScreenArgs({this.bmiStatus, this.bmiAdvice, this.bmiResult});
}