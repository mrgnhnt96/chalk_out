import 'package:flutter/material.dart';

class GameStartScreen extends StatelessWidget {
  static const routeName = '/game_start_screen';
  static const title = 'game start screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'this is the game start screen.',
        ),
      ),
    );
  }
}
