import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings_screen';
  static const title = 'settings screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Text('Data goes here'),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DraggableScrollableSheet(
              initialChildSize: 0.1,
              maxChildSize: 0.5,
              minChildSize: 0.1,
              builder: (context, ScrollController controller) {
                return SingleChildScrollView(
                  controller: controller,
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                      children: <Widget>[
                        Text('bottom sheet'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
