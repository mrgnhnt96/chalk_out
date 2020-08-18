import 'package:chalk_out/presentation/widgets/chalk_cards.dart';
import 'package:flutter/material.dart';

class ParticipatedChalksScreen extends StatefulWidget {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Your Turn (Hidden if None)'),
              Align(
                alignment: Alignment.center,
                child: ChalkCards(),
              ),
              Text('Live Chalks (Always show)'),
              Text(
                'Past Chalks',
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
