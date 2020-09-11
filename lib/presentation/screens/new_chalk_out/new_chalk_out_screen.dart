import 'package:chalk_out/presentation/blocs/new_chalk_out/new_chalk_out_bloc.dart';
import 'package:flutter/material.dart';

class NewChalkOutScreen extends StatelessWidget {
  const NewChalkOutScreen({
    Key key,
    @required this.newChalkOutBloc,
    @required this.title,
  }) : super(key: key);

  final NewChalkOutBloc newChalkOutBloc;
  final String title;

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
