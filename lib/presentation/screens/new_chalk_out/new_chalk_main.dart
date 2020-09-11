import 'package:flutter/material.dart';

class NewChalkMain extends StatelessWidget {
  static const routeName = '/new_chalk_main';
  static const title = 'new chalk main';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          'this is the new chalk main.',
        ),
      ),
    );
  }
}
