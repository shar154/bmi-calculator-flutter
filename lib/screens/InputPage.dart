import 'package:bmi_calculator/components/BMIContainer.dart';
import 'package:bmi_calculator/screens/Results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/BMIContainer.dart';
import '../constants.dart';
import '../components/CardContent.dart';
import '../components/RoundIconButton.dart';
import '../components/BottomButton.dart';
import 'package:bmi_calculator/bmi_calculator.dart';

enum Gender {male, female}


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {

  Color maleCardColour = kinactiveCardColour;
  Color femaleCardColour = kinactiveCardColour;
  Gender selectedGender;
  int height = 150;
  int weight = 60;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: BMIContainer(
                    colour: selectedGender == Gender.male
                        ? kactiveCardColour
                        : kinactiveCardColour ,
                      cardChild: CardContent(
                          cardText: 'MALE',
                          cardIcon: FontAwesomeIcons.mars),
                      tapFunction:(){
                        setState(() {
                          selectedGender = Gender.male;
                          });
                        },
                  ),
                ),
                Expanded(
                  child: BMIContainer(
                      colour: selectedGender == Gender.female
                          ? kactiveCardColour
                          : kinactiveCardColour ,
                      cardChild: CardContent(
                          cardText: 'FEMALE',
                          cardIcon: FontAwesomeIcons.venus),
                      tapFunction:(){
                        setState(() {
                          selectedGender = Gender.female;

                        });
                      },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BMIContainer(
              colour: kactiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('HEIGHT',
                    style: ktextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(height.toString(),
                        style: knumberTextStyle,
                      ),
                      Text('cm',
                      style: ktextStyle,),
                      ]
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 10.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0)
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 220,
                      inactiveColor: Color(0xFF8D8E98),
                      divisions: 100,
                      onChanged: (val){
                        setState(() {
                          this.height = val.round();
                        });
                        },
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: BMIContainer(
                      colour: kactiveCardColour,
                      cardChild:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: ktextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: knumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    tapButton: (){
                                      setState(() {
                                        weight--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    tapButton: (){
                                      setState(() {
                                        weight++;
                                      });
                                    }),
                              ],
                            )
                          ],

                        )
                  ),
                ),
                Expanded(
                  child: BMIContainer(
                      colour: kactiveCardColour,
                      cardChild:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: ktextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: knumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  tapButton: (){
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  tapButton: (){
                                    setState(() {
                                      age++;
                                    });
                                  }),
                            ],
                          )
                        ],

                      )
                    ,),
                ),
              ],
            ),
          ),
          BottomButton(
              title: 'CALCULATE',
              onTap: () {
                print('Calculating BMI');
                BMICalculator calc = BMICalculator(weight: weight, height: height);
                Navigator.pushNamed(
                  context,
                  '/results',
                  arguments: ResultScreenArgs(
                    bmiResult : calc.CalculateBMI(),
                    bmiStatus: calc.getResults(),
                    bmiAdvice: calc.getAdvice(),)
                  );
              }),
        ],
      )
    );
  }
}

