import 'package:flutter/material.dart';

class ChalkCards extends StatelessWidget {
  const ChalkCards({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        width: MediaQuery.of(context).size.width * .8,
        height: 150,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Username guessed',
                  ),
                  Text(
                    '_______',
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('?????'),
                    Text('Time Invited'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
