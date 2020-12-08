import 'package:flutter/material.dart';

class DrawChalkMain extends StatelessWidget {
  static const routeName = '/draw_chalk_main';
  static const title = 'draw chalk main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'this is the draw chalk main.',
        ),
      ),
    );
  }
}
