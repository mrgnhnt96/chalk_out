import 'package:flutter/material.dart';

import 'package:chalk_out/presentation/blocs/new_chalk_out/new_chalk_out_bloc.dart';

class NewChalkOutScreen extends StatelessWidget {
  const NewChalkOutScreen({
    Key key,
    @required this.newChalkOutBloc,
    @required this.title,
    @required this.randomWord,
  }) : super(key: key);

  final NewChalkOutBloc newChalkOutBloc;
  final String title;
  final String randomWord;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              newChalkOutBloc.add(NewChalkOutClosePressed());
            },
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.right,
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: 75,
              child: Center(child: Text(randomWord)),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                child: Text('Random'),
                onPressed: () {
                  newChalkOutBloc.add(NewRandomWordPressed());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
