import 'package:flutter/material.dart';
import 'screens/InputPage.dart';
import 'screens/Results.dart';
void main() => runApp(BMICalculator());



class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF0C0E22),
      textTheme: TextTheme(bodyText2: TextStyle(color:Colors.white)),
      ),
      initialRoute: '/calculator',
      routes: {
        '/calculator':  (context) => InputPage(),
        '/results': (context) => ResultPage(),
      },
    );
  }
}

