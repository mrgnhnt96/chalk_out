import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home_screen';
  static const title = 'home screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'this is the home screen.',
        ),
      ),
    );
  }
}
