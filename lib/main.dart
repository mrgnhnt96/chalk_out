import 'package:chalk_out/presentation/screens/home/home_screen.dart';
import 'package:chalk_out/presentation/screens/participated_chalks/participated_chalks_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CHALK_OUT',
      theme: ThemeData(),
      home: ParticipatedChalksScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ParticipatedChalksScreen.routeName: (ctx) => ParticipatedChalksScreen(),
      },
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => HomeScreen());
      },
    );
  }
}
