import 'package:chalk_out/presentation/widgets/core/chalk_cards.dart';
import 'package:flutter/material.dart';

class ParticipatedChalksScreen extends StatefulWidget {
  static const routeName = '/participated_chalk_screen';
  static const title = 'participated chalk screen';

  ParticipatedChalksScreen({Key key}) : super(key: key);

  @override
  _ParticipatedChalksScreenState createState() => _ParticipatedChalksScreenState();
}

class _ParticipatedChalksScreenState extends State<ParticipatedChalksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Chalk Out'),
        ),
        leading: Icon(
          Icons.notifications,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.settings),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                    child: Text('Your Turn (Hidden if None)'),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: ChalkCards(),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                    child: Text('Live Chalks (Always show)'),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 8),
                    child: Text(
                      'Past Chalks',
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
